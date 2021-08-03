//
//  LoginScreen.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI


struct LoginScreen: View {
    
//    @State private var isMain :Bool = false
//    @State private var isSignUp:Bool = false
    @State private var activeSheets: Sheets?
    
    @StateObject private var loginVM = AuthViewModel()
    
    enum Sheets: Identifiable {
    
        var id: Int {
            self.hashValue
        }
    
        case Main
        case SignUp
    }
    
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
                    
                    Text("Sign-in to Continue")
                        .font(.footnote)
                        .fontWeight(.light)
                }
                
                VStack(alignment:.leading) {
            
                    HStack {
                        Image(systemName:"person.fill")
                            .foregroundColor(.gray)
                        TextField("Enter your email",text: $loginVM.email)
                        
                    }.textViewStyle(roundCorner: 10)
                    .padding(.vertical,5)
                    HStack {
                        Image(systemName:"key")
                            .foregroundColor(.gray)
                        SecureField("Enter your Password",text: $loginVM.password)
                        
                    }.textViewStyle(roundCorner: 10)

                }.padding(.vertical,15)
                
                VStack {
                    
                    Button(action :{
                        loginVM.login {
                            activeSheets = .Main
                            print("Hello")
                        }
                    }) {
                        Text("Sign in")
                            .fontWeight(.bold)
                    }.buttonStyle(ButtonBackgroundStyle())
                    
                    Button(action :{}) {
                        Text("Forgot Password")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    
                }
                
                Spacer(minLength: 0)
                VStack(alignment:.center) {
                    HStack() {
                        Spacer(minLength: 0)
                        Text("Don't have an account?")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        
                        Button(action :{
                            activeSheets = .SignUp
                        }) {
                            Text("Sign Up")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color1"))
                        }
                        Spacer(minLength: 0)

                        
                    }
                }
            }.padding()
           
        .fullScreenCover(item: $activeSheets ){ item in
            switch item {
            case .Main:
                MainView()
            case .SignUp:
                SignScreen()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }

}



#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif






struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}





extension View {
    
    func textViewStyle(roundCorner:CGFloat) -> some View {
        self
            .padding()
            .overlay(
        RoundedRectangle(cornerRadius: roundCorner)
            .stroke(Color.gray, lineWidth: 1)
            .shadow(color: Color.gray, radius: 1)
    )
//            .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
    
}



