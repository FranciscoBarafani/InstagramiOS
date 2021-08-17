//
//  TextView.swift
//  InstagramFirestore
//
//  Created by Francisco Barafani on 16/08/2021.
//

import UIKit

class InputTextView: UITextView {
    // MARK: -Properties
    
    var placeholderText: String? {
        didSet {
            placeholderLabel.text = placeholderText
        }
    }
    
    private let placeholderLabel: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    // MARK: -Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 8)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Failed")
    }
    
    // MARK: -Actions
    
    @objc func handleTextDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }

}
