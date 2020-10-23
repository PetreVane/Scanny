//
//  StartingViewController.swift
//  QRCodeScanner
//
//  Created by Petre Vane on 21/10/2020.
//

import UIKit

protocol StartingViewControllerDelegate: AnyObject {
    func didPressScanButton()
}

class StartingViewController: UIViewController {
    
    
    // TODO: - Configure button
    
    weak var delegate: StartingViewControllerDelegate?
    let customLabel = UILabel()
    let customImage = UIImageView()
    let scanButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeLabel()
//        customizeImage()
        configureScanButton()
    }
    
   
    //MARK: - Custom visual elements
    
    
    func customizeLabel() {
        view.addSubview(customLabel)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        
        customLabel.text = "Quick Scan"
        customLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        customLabel.textColor = UIColor.systemGray2
        
        NSLayoutConstraint.activate([
            customLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            customLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            customLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    
    func configureScanButton() {
        view.addSubview(scanButton)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setImage(UIImage(named: "focus"), for: .normal)
        
        let xConstr = scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yConstr = scanButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let width = scanButton.widthAnchor.constraint(equalToConstant: 100)
        let height = scanButton.heightAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([xConstr, yConstr, width, height])
        
        scanButton.addTarget(self, action: #selector(instantiateScanScreen), for: .touchUpInside)
    }
    
    @objc private func instantiateScanScreen() {
        delegate?.didPressScanButton()
        print("Scan button pressed ...")
    }
}


extension StartingViewController {
    class func instantiate(delegate: StartingViewControllerDelegate) -> StartingViewController {
        let vc = StartingViewController()
        vc.delegate = delegate
        return vc
    }
}
