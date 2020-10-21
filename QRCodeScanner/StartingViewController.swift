//
//  StartingViewController.swift
//  QRCodeScanner
//
//  Created by Petre Vane on 21/10/2020.
//

import UIKit



class StartingViewController: UIViewController {
    
    let customLabel = UILabel()
    let customImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customizeLabel()
        customizeImage()
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
    
    
    func customizeImage() {
        view.addSubview(customImage)
        customImage.translatesAutoresizingMaskIntoConstraints = false
        
        customImage.image = UIImage(named: "focus")
//        customImage.image?.renderingMode = .
        NSLayoutConstraint.activate([
            
            customImage.topAnchor.constraint(equalTo: customLabel.bottomAnchor, constant: 200),
            customImage.leadingAnchor.constraint(equalTo: customLabel.leadingAnchor),
            customImage.trailingAnchor.constraint(equalTo: customLabel.trailingAnchor),
            customImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }
}
