//
//  FriendViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/31/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class FriendViewModel :ObservableObject {
    
    @Published var requests :[Request]  = [Request]()
    @Published  var isRequestSend:Bool = false
    @Published  var isRequestAccept:Bool = false
    
    var notifications : NotificationViewModel = NotificationViewModel()
    
    init() {
        fetchFriends()
    }
    

    
    func deleteFriend(user :User) {
        
        let currentUser = AuthViewModel.shared.currentUser
        

        Firestore.firestore().collection("Friend")
            .document(currentUser!.uid).collection("friends")
            .document((currentUser?.id)!).delete { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
           
        
    }
    

    func fetchFriends() {
        guard  let currentUser = Auth.auth().currentUser  else {
              return
          }

        Firestore.firestore().collection("Friend").document(currentUser.uid).collection("friends").getDocuments { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }

            guard let documents = snapshot?.documents else {
                return
            }

            DispatchQueue.main.async {
                self.requests = documents.compactMap {
                    try? $0.data(as: Request.self)
                }
            }

        }

    }
    
    
    func AcceptRequests(user:User) {
    
        let currentUser = AuthViewModel.shared.currentUser
        let data1  =  [
            "fullName":user.fullName,
            "userProfileImage" :"",
            "uid":user.uid
        ]
        Firestore.firestore().collection("Friend")
            .document(currentUser!.uid).collection("friends")
            .addDocument(data:data1 as [String : Any]  ) { (error) in
                if let error  = error {
                    print(error.localizedDescription)
                }
            }
        
        let data2  =  [
            "fullName":currentUser?.fullName,
            "userProfileImage" :"",
            "uid":currentUser!.uid
        ]
        
        Firestore.firestore().collection("Friend")
            .document(user.uid).collection("friends")
            .addDocument(data:data2 as [String : Any]  ) { (error) in
                if let error  = error {
                    print(error.localizedDescription)
                }
            }

        DispatchQueue.main.async {
            self.isRequestAccept = true
        }
        
        
    }
    
    
    func Sentrequest(user:User ,completion:@escaping () ->Void) {
      
        let currentUser = AuthViewModel.shared.currentUser
        
        let data  =  [
            "fullName":currentUser?.fullName,
            "userProfileImage" :"",
            "uid":currentUser?.uid,
            "isRequest":"true"
  
        ]
        
        Firestore.firestore().collection("Request").document(user.uid).collection("requests").addDocument(data: data as [String : Any]) { [self] (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            notifications.SentRequestNotification(user: user)
            DispatchQueue.main.async {
                self.isRequestSend = true
            }
        }
        
    }
    
    
    func DeleteRequests(user:Request) {
        
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        Firestore.firestore().collection("Request")
            .document(currentUser.uid)
            .collection("requests").document(user.id!).delete { (error) in
                if let error  = error {
                    print(error.localizedDescription)
                }
            }
    }

    
}










//    func AddFriends(user:User,completion:@escaping () ->Void) {
//
//        guard let currentUser = Auth.auth().currentUser else {
//            return
//        }
//
//        let data  =  [
//            "fullName":user.fullName,
//            "userProfileImage" :"",
//            "uid":user.uid
//
//        ]
//
//        Firestore.firestore().collection("Friend")
//            .document(currentUser.uid)
//            .collection("friends")
//            .addDocument(data: data as [String : Any]) { [ self] (error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//                notifications.SentRequestNotification(user: user)
//                DispatchQueue.main.async {
//                    self.isRequestSend = true
//                }
//            }
//
//
//    }
//
//    func acceptFriend(user:User) {
//
//        guard  let currentUser = AuthViewModel.shared.currentUser else {
//            return
//        }
//
//        let data  =  [
//            "fullName":currentUser.fullName,
//            "userProfileImage" :"",
//            "uid":currentUser.uid
//        ]
//
//        Firestore.firestore().collection("users")
//            .document(user.uid).collection("friends")
//            .addDocument(data: data as [String : Any]) { (error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//
//                DispatchQueue.main.async {
//                    self.isRequestAccept = true
//                }
//            }
//    }
