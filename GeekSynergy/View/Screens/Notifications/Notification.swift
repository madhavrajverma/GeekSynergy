//
//  Notification.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI

struct Notification: View {
    
    @StateObject  private var notificationViewModel : NotificationViewModel = NotificationViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators:false) {
                VStack {
                    ForEach(notificationViewModel.notificatios) {
                        notifcations in
                        Divider()
                        NotificationView(notifcations:notifcations)
                            .padding(.horizontal,5)
                    }
                }
            } .navigationBarTitle("Notifications",displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "message")
                        .font(.system(size: 25))
            })
        }.onAppear {
            notificationViewModel.fetchAllNotification()
        }
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}


