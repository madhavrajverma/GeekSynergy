//
//  LikeCommentView.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/25/21.
//

import SwiftUI


struct LikeCommentView:View {
    var body: some View {
        HStack {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Button(action :{}) {
                HStack {
                    
                    Text("34")
                        .font(.caption)
                        .fontWeight(.heavy)
                    Image(systemName: "hand.thumbsup")
                        .font(.caption)
//                        .foregroundColor(Color("Color1"))
        
                }.padding(5)
                .padding(.horizontal,8)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .shadow(color: Color.gray, radius: 1)
                )
            }
            .accentColor(.black)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Button(action:{}) {
                HStack {
                    
                    Text("35")
                        .font(.caption)
                        .fontWeight(.heavy)
                    Image(systemName: "plus.message")
                        .font(.caption)
//                        .foregroundColor(Color("Color1"))
        
                }.padding(5)
                .padding(.horizontal,8)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .shadow(color: Color.gray, radius: 1)
                )

            }.accentColor(.black)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
        .padding(.vertical,2)
    }
}


