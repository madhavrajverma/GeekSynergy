//
//  PostListViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/11/21.
//
import Foundation
import SwiftUI
import  Firebase
import FirebaseFirestoreSwift


enum LoadingState {
    
    case idle
    case loading
    case success
    case failure
}


class PostListViewModel :ObservableObject {
    let db = Firestore.firestore()
    @Published  var posts :[PostViewModel] = []
    @Published var loadingState :LoadingState = .idle

    
    func getAllPost(completion:@escaping ()->Void) {
        
        DispatchQueue.main.async {
            self.loadingState = .loading
        }
        

        db.collection("Post")
//            .whereField("userID", isEqualTo: currentUser.uid)
            .getDocuments { [weak self] (snapshot, error) in
                if let error = error {
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self?.loadingState = .failure
                    }
                } else {
                    
                    if let snapshot = snapshot {
                        let post: [PostViewModel] = snapshot.documents.compactMap {
                            doc in
                            var post = try? doc.data(as: Post.self)
                            post?.id = doc.documentID
                            if let post = post {
                                return PostViewModel(post: post)
                                
                            }
                            return nil
                            
                        }
                        
                        DispatchQueue.main.async {
                            self?.posts = post
                            self?.loadingState = .success

                        
                        }
                        
                        
                    }
                }
            }
        
        
    }
    
    
    
    
}


struct PostViewModel {
    let post :Post
    
    var id :String {
        post.id  ?? ""
    }
    
    var name :String {
        post.name
    }
    
    var desingnation:String {
        post.designation
    }
    var profileImage:String {
        post.profileImage ?? ""
    }
    
    var postImage:String {
        post.postImage ?? ""
    }
    
    var postTitle:String  {
        post.postTitle
    }
    
    
    
}


