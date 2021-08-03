//
//  SeacrhScreen.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/8/21.
//

import SwiftUI

enum SearchType:String , CaseIterable {
    case CollabUser
    case SearchUser
}

struct SeacrhScreen: View {
    
    @StateObject var  searchViewModel = SeacrhViewModel()

    @State private var searchText = ""
     var seacrchType:SearchType 
    
    @Environment(\.presentationMode) var presentationMode

    var users :[User]  {
        
        return searchText.isEmpty ? searchViewModel.users : searchViewModel.filterUser(withtext: searchText)
    }
    
    var body: some View {

        
            VStack{
                HStack {
                    Button(action:{
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                            .padding(.leading, 8)
                    }
                    SearchBar(text: $searchText)
                        .padding(.vertical,5)
                   
                }
                
                if seacrchType == .CollabUser {
                    ScrollView(.vertical , showsIndicators:false) {
                        ForEach(users) { user in
                            Divider()
                            NavigationLink(destination:MessageListScreen()) {
                                UserSearchResult(user:user)
                            }
                            
                        }
                    }
                    
                } else if seacrchType == .SearchUser {
                    ScrollView(.vertical , showsIndicators:false) {
                        ForEach(0..<10) { _ in
                            Divider()
                            NavigationLink(destination:MessageListScreen()) {
                                UserList()
                                    .padding(5)

                            }
                            
                        }
                    }
                }
               
            }.gesture(DragGesture()
                        .onChanged { _ in
                            hideKeyboard()
                        })
            .navigationBarHidden(true)
        
        
    }
}
