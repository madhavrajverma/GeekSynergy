//
//  CollabListView.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/29/21.
//

import SwiftUI

struct CollabListView: View {
    
    @StateObject var friends:FriendViewModel = FriendViewModel()
    let user : User
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action:{}) {
                        Image(systemName: "xmark")
                    }
                        
                }
                
                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 80, maxWidth: 110, minHeight: 80, maxHeight: 100)
                    .clipShape(Circle())
//                    .shadow(radius: 5)
                    .overlay(Circle().stroke(Color.white,lineWidth: 1))
                
                Text(user.fullName ?? "NO Name")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text(user.skills ?? "No skills")
                    .font(.caption)
                    .fontWeight(.medium)
                
                Button(action :{
                    friends.Sentrequest(user: user) {
                        
                    }
                }) {
                    Text(friends.isRequestSend ? "Sent" : "Collab")
                }.buttonStyle(OutlineButton())
                .disabled(friends.isRequestSend ? true :false)
         
            }.padding(5)
            .shadow(radius: 5)
            .background(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray))
            
            
        }
    }
}




struct OutlineButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .padding(5)
            .padding(.horizontal,15)
            .background(
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                ).stroke(Color.accentColor)
        )
    }
}
