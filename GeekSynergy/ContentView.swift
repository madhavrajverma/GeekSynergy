//
//  ContentView.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            Home().tabItem {
                TabItem(title: "Home", ImageName: "house")
            }
            CollabView().tabItem {
                TabItem(title: "Collab", ImageName: "person.3.fill")
            }
            NewPost().tabItem {
                TabItem(title: "New Post", ImageName: "plus")
            }
            Notification().tabItem {
                TabItem(title: "Notifications", ImageName: "bell")
            }
            Profile().tabItem {
                TabItem(title: "Profile", ImageName: "person.crop.square")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabItem: View {
    var title:String
    var ImageName:String
    
    var body: some View {
        HStack {
            Image(systemName: ImageName)
            Text(title)
        }
    }
}
