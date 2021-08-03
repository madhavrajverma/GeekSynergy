//
//  AddPostViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/11/21.
//

import Foundation
import SwiftUI
import  Firebase
import FirebaseFirestoreSwift



class AddPostViewModel :ObservableObject {
    
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    var profileImage:String = ""
    var postTitle:String = ""
    let user = AuthViewModel.shared.currentUser
    
    func savePost(url:URL?, completion:@escaping (Error?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        if let url = url {
        
                let data  = [
                    "name" : user?.fullName,
                    "designation" :user?.skills,
                    "profileImage" : user?.userProfileImage,
                    "postImage" :url.absoluteString,
                    "postTitle":postTitle,
                    "userID" :currentUser.uid,
                    "date" : Timestamp(date: Date()),

        
                ] as [String : Any?]
              let _  =   db.collection("Post")
                .addDocument(data: data as [String : Any], completion: { (err) in
                    if let err = err {
                        print(err.localizedDescription)
                        completion(err)
                    }
                })
                completion(nil)
        } else {
            
            let data  = [
                "name" : user?.fullName ,
                "designation" :user?.skills,
                "profileImage" : user?.userProfileImage,
                "postTitle":postTitle,
                "userID" :currentUser.uid,
                "date" : Timestamp(date: Date()),

            ] as [String : Any?]
            
            let _  =   db.collection("Post")
              .addDocument(data: data as [String : Any], completion: { (err) in
                  if let err = err {
                      print(err.localizedDescription)
                      completion(err)
                  }
              })
              completion(nil)
        }
            
        }
    
    
        }

    
    
//    func uploadPostImage(data:Data , completion :@escaping (URL?) -> Void) {
//
//        let imageName = UUID().uuidString
//        let storageRef = storage.reference()
//        let photoRef = storageRef.child("PostImages/\(imageName).png")
//        photoRef.putData(data,metadata: nil) { metadata ,error in
//            photoRef.downloadURL { (url, error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                }else {
//                    completion(url)
//                }
//            }
//        }
//    }
    

