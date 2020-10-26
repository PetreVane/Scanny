//
//  ScanningScreenViewController.swift
//  QRCodeScanner
//
//  Created by Petre Vane on 21/10/2020.
//

import UIKit
import AVFoundation


protocol ScanningScreenDelegate: AnyObject {
    func didPressBackButton(onViewController: UIViewController)
}

class ScanningScreenViewController: UIViewController {
    
    let topBar = UIView()
    let scanButton = CustomButton(title: "Start scanning")
    let closeButton = CustomButton(title: "Stop scanning")
    let bottomLabel = CustomLabel(text: "No QR Code detected", color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), alignment: .center)
    
    weak var delegate: ScanningScreenDelegate?
    let scanner = Scanner()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scanner.delegate = self
        configureBottomLabel()
        configureTopBar()
        configureCloseButton()
    }
        
    
    func configureBottomLabel() {
        view.addSubview(bottomLabel)
        
        NSLayoutConstraint.activate([
            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 75),
            bottomLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -75),
            bottomLabel.heightAnchor.constraint(equalToConstant: 75)
        ])
        
    }
    
    func configureTopBar() {
        view.addSubview(topBar)
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        let topConstr = topBar.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstr = topBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstr = topBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let heightConstr = topBar.heightAnchor.constraint(equalToConstant: 125)
        
        NSLayoutConstraint.activate([topConstr, leadingConstr, trailingConstr, heightConstr])
        configureScanButton()
    }
    
    func configureScanButton() {
        topBar.addSubview(scanButton)
        scanButton.setTitleColor(.green, for: .normal)
        let topConstr = scanButton.topAnchor.constraint(equalTo: topBar.topAnchor, constant: 70)
        let leadingConst = scanButton.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 100)
        let trailingConstr = scanButton.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -100)
        let heightConstr = scanButton.heightAnchor.constraint(equalToConstant: 35)
        
        NSLayoutConstraint.activate([topConstr, leadingConst, trailingConstr, heightConstr])
        scanButton.addTarget(self, action: #selector(didStartCapturing(_:)), for: .touchUpInside)
    }
    
    func configureCloseButton() {
        closeButton.addTarget(self, action: #selector(windBack), for: .touchUpInside)
        closeButton.setTitleColor(.orange, for: .normal)
        topBar.addSubview(closeButton)
        
        let topConstr = closeButton.topAnchor.constraint(equalTo: topBar.topAnchor, constant: 70)
        let leadingConst = closeButton.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 100)
        let trailingConstr = closeButton.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -100)
        let heightConstr = closeButton.heightAnchor.constraint(equalToConstant: 35)
        
        
        NSLayoutConstraint.activate([topConstr, leadingConst, trailingConstr, heightConstr])
        closeButton.isHidden = true
    }
    
    
    @objc func windBack() {
        print("Winding back ..")
        delegate?.didPressBackButton(onViewController: self)
    }
}

extension ScanningScreenViewController {
    class func instantiate(delegate: ScanningScreenDelegate) -> ScanningScreenViewController {
        let vc = ScanningScreenViewController()
        vc.delegate = delegate
        return vc
    }
}

extension ScanningScreenViewController: ScannerDelegate {
    
    @objc
    func didStartCapturing(_ capturingStarted: Bool) {
        if capturingStarted {
            scanButton.isHidden = true
            closeButton.isHidden = false
            return
        } else {
            scanButton.isHidden = false
            closeButton.isHidden = true
            scanner.startCapturingSession()
        }
    }
    
    
    func showDecodedText(_ text: String) {
        bottomLabel.text = text
    }
    

    func showError() {
        bottomLabel.text = "Missing QR Code"
    }
    
    func moveSubviewsToFront() {
        view.bringSubviewToFront(bottomLabel)
        view.bringSubviewToFront(topBar)
    }
}
