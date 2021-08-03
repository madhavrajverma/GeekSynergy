//
//  CollabViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/31/21.
//

import Foundation
import Firebase

class CollabViewModel :ObservableObject {
    

    @Published var users : [User] =  [User]()
    
    init() {
        SuggestionUser()
    }
    
    func SuggestionUser() {
    
        guard let currentUSer = Auth.auth().currentUser else {
            return
        }
    
    Firestore.firestore().collection("users")
        .whereField("uid", isNotEqualTo: currentUSer.uid)
        .getDocuments { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let documens = snapshot?.documents else {
                return
            }
            
            DispatchQueue.main.async {
                self.users = documens.compactMap {
                    try? $0.data(as: User.self)
                }
            }
            
        }
        
    }
    
    
    
    
  
    
    
}
