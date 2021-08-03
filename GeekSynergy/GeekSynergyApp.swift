//
//  GeekSynergyApp.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI
import Firebase

@main
struct GeekSynergyApp: App {
    
    init() {
        FirebaseApp.configure()
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]

    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(AuthViewModel.shared)
        }
    }
}
