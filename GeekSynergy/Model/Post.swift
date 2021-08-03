//
//  Post.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/29/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Post : Codable {
    var id :String?
    var  name:String = ""
    var designation:String = ""
    var profileImage:String? = ""
    var postImage:String? = ""
    var postTitle:String = ""
    var userID :String = ""
    var date :Timestamp
}








