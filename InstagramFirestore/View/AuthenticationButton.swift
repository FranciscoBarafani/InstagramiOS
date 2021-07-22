//
//  AuthenticationButton.swift
//  InstagramFirestore
//
//  Created by Francisco Barafani on 20/07/2021.
//

import UIKit

class AuthenticationButton: UIButton {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setTitle(placeholder, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init: Coder has not been implemented")
    }
}
