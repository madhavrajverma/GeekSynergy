//
//  Request.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/31/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Request :Codable ,Identifiable{
    @DocumentID var id:String?
    var fullName:String = ""
    var userProfileImage:String = ""
    var isRequest:Bool
    var uid:String
  
}
