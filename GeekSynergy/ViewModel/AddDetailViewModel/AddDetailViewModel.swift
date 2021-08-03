//
//  AddDetailViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/20/21.
//

import Foundation
import Firebase
import SwiftUI

class AddDetailViewModel :ObservableObject {
    
   
    var fullname :String = ""
    var skills:String = ""
    var Institution:String = ""

    
    func uploadData(completion:@escaping ()-> Void) {
        guard    let uid = Auth.auth().currentUser?.uid else {return}
        
        let data  = [
            "fullName" : fullname,
            "skills" : skills ,
            "institution" :Institution
        ]
        Firestore.firestore().collection("users").document(uid).updateData(data) { (err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            completion()
        }
    }
    
}
