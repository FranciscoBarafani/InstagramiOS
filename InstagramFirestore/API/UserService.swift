//
//  UserService.swift
//  InstagramFirestore
//
//  Created by Francisco  Barafani on 24/07/2021.
//

import Firebase
typealias FirestoreCompletion = (Error?) -> Void

struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { (res, error) in
            guard let res = res?.data() else { return }
            let user = User(dictionary: res)
            completion(user)
        }
    }
    
    static func fetchUsers(completion: @escaping([User]) -> Void){
        COLLECTION_USERS.getDocuments { (res, error) in
            guard let res = res else { return }
            let users = res.documents.map({ User(dictionary: $0.data())})
            completion(users)
        }
    }
    
    static func follow(uid: String, completion: @escaping(FirestoreCompletion)){
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_FOLLOWING.document(currentuid).collection("user-following").document(uid).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentuid).setData([:], completion: completion)
        }
    }
    
    static func unfollow(uid: String, completion: @escaping(FirestoreCompletion)){
        
    }
}
