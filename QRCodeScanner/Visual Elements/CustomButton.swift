//
//  CustomButton.swift
//  QRCodeScanner
//
//  Created by Petre Vane on 26/10/2020.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
    }
    
    func configureButton() {
        backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
    }
}
