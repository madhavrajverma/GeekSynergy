//
//  SignScreen.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI
      
struct SignScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var registerVM = AuthViewModel()
    @State private var isDetail :Bool = false
    
    var body: some View {
        VStack(alignment:.leading) {
            VStack(alignment:.leading) {
                Image("GEEKSYNERGY")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 40, maxWidth: 70, minHeight: 40, maxHeight: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                Text("WELCOME")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Create New Account")
                    .font(.footnote)
                    .fontWeight(.light)
            }
            
            VStack(alignment:.leading) {
        
                HStack {
                    Image(systemName:"person.fill")
                        .foregroundColor(.gray)
                    TextField("Enter your email",text: $registerVM.email)
                    
                }.textViewStyle(roundCorner: 10)
                .padding(.vertical,5)
                HStack {
                    Image(systemName:"key")
                        .foregroundColor(.gray)
                    SecureField("Enter your Password",text: $registerVM.password)
                    
                }.textViewStyle(roundCorner: 10)
                .padding(.vertical,5)
                
                HStack {
                    Image(systemName:"key")
                        .foregroundColor(.gray)
                    SecureField("Enter your Password",text: $registerVM.confirmPassword)
                    
                }.textViewStyle(roundCorner: 10)

            }.padding(.vertical,15)
            
            VStack {

                Button(action :{
                    registerVM.register {
                        isDetail = true
                        
                    }
                }) {
                    Text("Sign Up")
                        .fontWeight(.bold)
                }.buttonStyle(ButtonBackgroundStyle())
            }
            
            Spacer(minLength: 0)
            VStack(alignment:.center) {
                HStack() {
                    Spacer(minLength: 0)
                    Text("Already have account")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    
                    Button(action :{
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Sign In")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color1"))
                    }
                    Spacer(minLength: 0)

                    
                }
            }
        
            
        }.fullScreenCover(isPresented: $isDetail, content: {
            AddDetailScreen()
        })
        .padding()
        .onTapGesture {
            hideKeyboard()
        }
    }
}



struct SignScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignScreen()
    }
}
