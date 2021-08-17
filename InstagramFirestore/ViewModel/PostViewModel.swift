//
//  PostViewModel.swift
//  InstagramFirestore
//
//  Created by Francisco Barafani on 16/08/2021.
//

import Foundation

struct PostViewModel {
    private let post: Post
    
    var imageUrl: URL? { return URL(string: post.imageUrl) }
    
    var caption: String { return post.caption }
    
    var likes: Int { return post.likes }
    
    var userProfileImageUrl: URL?  { return URL(string: post.ownerImageUrl) }
    
    var username: String { return post.ownerUsername }
    
    var labelLikesText: String {
        if post.likes != 1 {
            return "\(post.likes) likes"
        } else {
            return "\(post.likes) like"
        }
    }
    
    init(post: Post) {
        self.post = post
    }
}
