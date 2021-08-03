//
//  SearchScreen.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/20/21.
//

import SwiftUI

struct SearchScreen: View {
    @State private var text:String = ""
    
    var body: some View {
        VStack {
        SearchBar(text: $text)
    }
}
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}



struct ListView:View {
    
    var body: some View {
        
        HStack {
            Image("5")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .clipped()
            
            VStack(alignment:.leading) {
                Text("Madhav")
                    .font(.subheadline)
                    .fontWeight(.black)
                
                Text("Ios")
                    .font(.caption2)
                    .fontWeight(.light)
                
                HStack(spacing:10)  {
                    
                    Button(action:{}) {
                        Text("Collab")
                            .font(.body)
                            .padding(10)
                            .background(Color("Color1"))
                            .foregroundColor(.white)
                    }
                    
                    Button(action:{}) {
                        Text("Cancel")
                            .font(.body)
                            .padding(10)
                            .background(Color("Color1"))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        
    }
    
}
