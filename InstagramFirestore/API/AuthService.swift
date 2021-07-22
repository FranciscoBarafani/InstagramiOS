//
//  AuthService.swift
//  InstagramFirestore
//
//  Created by Francisco Barafani on 21/07/2021.
//

import Firebase
import UIKit

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> Void){
        //Escaping works as a then, so after completion its called in the other function
        //this function continues
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
                if let error = error {
                    print("Debug: Failed to register user: \(error.localizedDescription)")
                    return
                }
                print("HOLA2")
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = ["email": credentials.email,
                                           "fullname": credentials.fullname
                                           ,"profileImageUrl": imageUrl,
                                           "uid": uid,
                                           "username": credentials.username]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
    
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?  ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
}
