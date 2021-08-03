//
//  MainView.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/20/21.
//

import SwiftUI

struct MainView: View {
    
    @StateObject  var authVM  = AuthViewModel()
    
    var body: some View {
        Group {
            if authVM.userSession == nil {
                LoginScreen()
                   
            }else {
                ContentView()
                   
            }
        }
    }
}


