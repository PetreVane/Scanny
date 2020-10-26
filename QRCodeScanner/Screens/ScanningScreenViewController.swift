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
    let scanButton = UIButton()
    let bottomLabel = CustomLabel(text: "No QR Code detected", color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), alignment: .center)
    let closeButton = UIButton(type: .close)
    weak var delegate: ScanningScreenDelegate?
    let scanner = Scanner()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scanner.delegate = self
        configureBottomLabel()
        configureTopBar()
        configureButton()
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
        scanButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Press to Scan", for: .normal)
        
        let topConstr = scanButton.topAnchor.constraint(equalTo: topBar.topAnchor, constant: 70)
        let leadingConst = scanButton.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 100)
        let trailingConstr = scanButton.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -100)
        let heightConstr = scanButton.heightAnchor.constraint(equalToConstant: 35)
        
        NSLayoutConstraint.activate([topConstr, leadingConst, trailingConstr, heightConstr])
        scanButton.addTarget(self, action: #selector(startScanning), for: .touchUpInside)
    }
    
    func configureButton() {
        closeButton.addTarget(self, action: #selector(windBack), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(named: "cross"), for: .normal)
        closeButton.tintColor = .blue
        topBar.addSubview(closeButton)
        
        let topConstr = closeButton.topAnchor.constraint(equalTo: scanButton.topAnchor, constant: 10)
        let leadingConstr = closeButton.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 25)
        let trailingConstr = closeButton.trailingAnchor.constraint(equalTo: scanButton.leadingAnchor, constant: -55)
        let heightConstr = closeButton.heightAnchor.constraint(equalToConstant: 15)
        
        NSLayoutConstraint.activate([topConstr, leadingConstr, trailingConstr, heightConstr])
    }
    
    @objc func startScanning() {
        scanner.startCapturingSession()
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
