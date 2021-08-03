//
//  CollabView.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI

struct CollabView: View {
    
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
          GridItem(.flexible(), spacing: 10),
      ]
    
    @State private var isSearch: Bool = false
    @StateObject var suggestionUser: CollabViewModel = CollabViewModel()
    
    var body: some View {

        NavigationView {
            ScrollView(.vertical,showsIndicators:false) {
                VStack(alignment:.leading) {
                    
                    Text("Suggestion For You")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    LazyVGrid(columns: columns, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16, content: {
                        ForEach(suggestionUser.users) { user  in
                            CollabListView(user: user)
   
                        }
                    })
                    NavigationLink(destination: SeacrhScreen(seacrchType: .CollabUser), isActive: $isSearch) {
                        
                    } .navigationBarBackButtonHidden(true)

                    
                }.padding()
                
            }
            .navigationBarTitle("Collabration",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
               isSearch = true
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 25))
            })
          
        }.onAppear {
            suggestionUser.SuggestionUser()
        }
    }
}

struct CollabView_Previews: PreviewProvider {
    static var previews: some View {
        CollabView()
    }
}


