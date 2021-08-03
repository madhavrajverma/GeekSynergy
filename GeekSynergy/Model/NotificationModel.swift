//
//  Notification.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/31/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct NotificationModel :Codable,Identifiable{
    @DocumentID var id: String?
    var notificationString:String = ""
    var uid:String
    var userProfileImage:String = ""
    var date :Timestamp
}


enum NotificationType: Int, Decodable {
    case follow
    case comment
    case like
    
    
    var notificationsMessage: String {
        switch self {
        case .like:
            return " liked one of your posts."
        case .comment:
            return " commented on one of your posts."
        case .follow:
            return " started following you."
        }
    }
}
