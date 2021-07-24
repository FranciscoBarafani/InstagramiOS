//
//  ProfileCell.swift
//  InstagramFirestore
//
//  Created by Francisco  Barafani on 24/07/2021.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: -Properties
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "venom-7")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: -Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("DEBUG: Initializer failed")
    }
}
