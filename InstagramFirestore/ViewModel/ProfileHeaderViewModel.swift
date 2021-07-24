//
//  ProfileHeaderViewModel.swift
//  InstagramFirestore
//
//  Created by Francisco  Barafani on 24/07/2021.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User

    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User){
        self.user = user
    }
}
