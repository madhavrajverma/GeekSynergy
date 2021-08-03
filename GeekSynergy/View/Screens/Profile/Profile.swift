//
//  Profile.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI

struct Profile: View {
    @StateObject private var authVM = AuthViewModel()
    @State private var isMain: Bool =  false
    
    var body: some View {
        
//        let list  = ["Your Collabration", "Skills" , "Contact" , ""]
        
        NavigationView {
            ScrollView(.vertical,showsIndicators:false) {
                VStack {
                    
                    VStack {
                        Image("5")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 150, maxWidth:250, minHeight: 100, maxHeight: 100 )
                        
                        Text(authVM.currentUser?.fullName ?? "")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text(authVM.currentUser?.skills ?? "")
                            .font(.caption)
                            .fontWeight(.bold)
                    }.padding()
                
                    Button(action : {
                        authVM.logOut {
                            isMain = true
                        }
                    }) {
                        Text("Log out")
                            .padding()
                            .background(Color("Color1"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    
    

                    
                }
            }
//            .onAppear(perform: {
//                authVM.fetchUser()
//            })
            .fullScreenCover(isPresented: $isMain, content: {
               MainView()
           })

//            .navigationBarColor(UIColor(Color("Color1")))
            .navigationBarTitle("Profile",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "gear")
                    .font(.system(size: 25))
            })
            
        }    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}



