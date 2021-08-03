//
//  SearchgViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/25/21.
//

import Foundation
import Firebase

class SeacrhViewModel :ObservableObject{
    
    @Published var users  = [User]()
    var user = [User]()
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        Firestore.firestore().collection("users").getDocuments { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let documents  = snap?.documents else  {
                return
            }
            
            self.user = documents.compactMap {
               try? $0.data(as: User.self)
            }
        }
    }
    
    
    
    func filterUser(withtext input: String) -> [User] {
        users = user
        let lowercasedInput = input.lowercased()
        return users.filter({ ($0.fullName?.lowercased().contains(lowercasedInput)) != nil || (($0.skills?.lowercased().contains(lowercasedInput)) != nil) })
    }
}
