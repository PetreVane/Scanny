//
//  CustomLabel.swift
//  QRCodeScanner
//
//  Created by Petre Vane on 21/10/2020.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, color: UIColor, alignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.textAlignment = alignment
        
    }
    
    func configureLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.9254191518, green: 0.9255301356, blue: 0.925381422, alpha: 1)
        layer.cornerRadius = 15
        clipsToBounds = true
        font = UIFont.preferredFont(forTextStyle: .title3)
    }
}
