//
//  User.swift
//  InstagramFirestore
//
//  Created by Francisco  Barafani on 24/07/2021.
//

import Foundation

struct User {
    let email: String
    let fullname: String
    let profileImageUrl: String
    let username: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String  ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String  ?? ""
        self.username = dictionary["username"] as? String  ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
