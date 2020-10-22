//
//  ScanningScreenViewController.swift
//  QRCodeScanner
//
//  Created by Petre Vane on 21/10/2020.
//

import UIKit



class ScanningScreenViewController: UIViewController {
    
    let topBar = UIView()
    let topLabel = CustomLabel(text: "Scan", color: .white, alignment: .center)
    let bottomLabel = CustomLabel(text: "No QR Code detected", color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), alignment: .center)
    let closeButton = UIButton(type: .close)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        configureTopLabel()
    }
    
    func configureTopLabel() {
        topBar.addSubview(topLabel)
        topLabel.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        let topConstr = topLabel.topAnchor.constraint(equalTo: topBar.topAnchor, constant: 70)
        let leadingConst = topLabel.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 100)
        let trailingConstr = topLabel.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -100)
        let heightConstr = topLabel.heightAnchor.constraint(equalToConstant: 35)
        
        NSLayoutConstraint.activate([topConstr, leadingConst, trailingConstr, heightConstr])
    }
    
    func configureButton() {
        closeButton.addTarget(self, action: #selector(windBack), for: .touchUpInside)
//        closeButton.setImage(UIImage(named: "cross"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(named: "cross"), for: .normal)
        closeButton.tintColor = .blue
        topBar.addSubview(closeButton)
        
        let topConstr = closeButton.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 10)
        let leadingConstr = closeButton.leadingAnchor.constraint(equalTo: topBar.leadingAnchor, constant: 25)
        let trailingConstr = closeButton.trailingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: -55)
        let heightConstr = closeButton.heightAnchor.constraint(equalToConstant: 15)
        
        NSLayoutConstraint.activate([topConstr, leadingConstr, trailingConstr, heightConstr])
    }
    
    @objc func windBack() {
        print("Winding back ..")
    }
}
