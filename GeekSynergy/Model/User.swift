//
//  User.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/20/21.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable,Identifiable{
    @DocumentID var id: String?
    var fullName:String? = ""
    var userProfileImage:String? = ""
    var skills:String? = ""
    var uid:String
    var email:String
    var Institution:String? = ""
    
}
