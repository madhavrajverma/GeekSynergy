//
//  AddDetailScreen.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/20/21.
//

import SwiftUI

struct AddDetailScreen: View {
    
    @StateObject  private var addDetailVM = AddDetailViewModel()
    @State private  var IsMain :Bool = false
    
    var body: some View {
        VStack {
            
            Image("5")
                .resizable()
                .scaledToFit()
                .frame(width:150,height: 100)
                .clipped()
            
            TextField("Full Name", text: $addDetailVM.fullname)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Skills", text: $addDetailVM.skills)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Institution", text: $addDetailVM.Institution)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action :{
                addDetailVM.uploadData {
                    IsMain = true
                }
            }) {
                Text("Next")
                    .padding()
                    .background(Color("Color1"))
                    .foregroundColor(.white)
            }
            
            Button(action:{
                IsMain = true
            }) {
                Text("Skip")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10))
            }
            
            
        }.padding(10)
        .fullScreenCover(isPresented: $IsMain, content: {
            MainView()
        })
        
    }
}

struct AddDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailScreen()
    }
}
