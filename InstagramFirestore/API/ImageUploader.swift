//
//  ImageUploader.swift
//  InstagramFirestore
//
//  Created by Francisco Barafani on 21/07/2021.
//

import FirebaseStorage

struct ImageUploader {
    //Uploads Image to Firebase
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image\(error.localizedDescription)")
                return
            }
            ref.downloadURL { url, error in
                if let error = error {
                    print("DEBUG: Error while downloading image url \(error))")
                    return
                }
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
       
    }
}
