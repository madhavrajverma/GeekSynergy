//
//  NotficationViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/31/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class NotificationViewModel:ObservableObject {
    
    @Published var notificatios:[NotificationModel] = [NotificationModel]()
    
    init() {
        fetchAllNotification()
    }
    
    func fetchAllNotification() {
        guard let currenUser = Auth.auth().currentUser else {
            return
        }
        
        Firestore.firestore().collection("Notification")
            .document(currenUser.uid)
            .collection("notifications")
            .getDocuments { (snapshot, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                guard let documents = snapshot?.documents else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.notificatios = documents.compactMap {
                        try? $0.data(as: NotificationModel.self)
                    }
                }
                
            }

    }
    

    func SentRequestNotification(user:User) {
        
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let notificationString = "\(String(describing: user.fullName)) want to collab with You"
        let data = [
            "fullName": String(describing: user.fullName) ,
            "userProfileImage":"",
            "uid":currentUser.uid,
            "notificationString":notificationString,
            "date": Timestamp(date: Date())
        
        ] as [String : Any]
        
        Firestore.firestore().collection("Notification").document(user.uid)
            .collection("notifications")
            .addDocument(data: data as [String : Any]) { [self] (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                fetchAllNotification()
            }
    }
    
    
    
}
