//
//  NotificationView.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/25/21.
//

import SwiftUI

struct NotificationView:View {

    let notifcations:NotificationModel
    
    var body: some View {
        
        HStack {
            
            Image("5")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 40, maxWidth: 50, minHeight: 40, maxHeight: 50)
                .clipShape(Circle())
                .padding(2)
                
            VStack(alignment:.leading) {
                
                
                HStack(alignment:.top) {
                    Text(notifcations.notificationString)
                        .font(.caption)
                        .fontWeight(.semibold)
                    Spacer(minLength: 0)
                    
                    Button(action:{}) {
                        Text("Accept")
                            .padding(.horizontal,2)
                        
                        
                }
                }
                Spacer(minLength: 0)
                
                HStack {
                    Spacer(minLength: 0)
                    Text("2hr")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                    
            }.padding(.horizontal,4)
        }
    }
    

    
}


