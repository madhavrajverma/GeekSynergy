//
//  AuthViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/20/21.
//

import Foundation
import Firebase


class AuthViewModel : ObservableObject {
    
    @Published var userSession:Firebase.User?
    @Published var currentUser :User?
    
    var email:String = ""
    var password:String = ""
    var  fullname:String = ""
    var confirmPassword: String = ""
    
    static let shared = AuthViewModel()

    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    
    
    func register(completion:@escaping () -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }else {
                guard let user =  result?.user else {return}
                
                let data = ["email": self.email,
                            "uid": user.uid]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { err in
                    if let err = err {
                        print(err.localizedDescription)
                        return
                    }
                    
                    self.userSession = user
                }
                self.fetchUser()
                completion()
            }
        }
    }

    
    
    
    func login(completion: @escaping() -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }else  {
                
                guard let user = result?.user else {return}
                self.userSession = user
                self.fetchUser()
                completion()
            }
        }
    }
    
    func logOut(completion:@escaping() -> Void) {
        self.userSession = nil
        try? Auth.auth().signOut()
        completion()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else {
            return
        }
        
        Firestore.firestore().collection("users").document(uid).getDocument { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
         
            if let snap = snap {
                let user = try? snap.data(as: User.self)
                self.currentUser = user

                
            }
         
          
    
        }
    }
    
}


