//
//  NewPost.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI

import KeyboardToolbar


enum SourceType {
    case photoLibrary
    case camera
}



struct NewPost: View {
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: SourceType = .photoLibrary
//    @State private var image: UIImage?
    @State private var originalImage: UIImage? = nil
    
    @StateObject private var addPostVM = AddPostViewModel()
    @StateObject private var PostListVM = PostListViewModel()
    
    
    
    
    private func savePost() {
          
        if originalImage != nil {
            if let postImage = originalImage {
                ImageUploader.uploadImage(image: postImage, type: .post) { (url) in
                    if let url = url {
                        addPostVM.savePost(url: url) { (error) in
                            originalImage = nil
                            addPostVM.postTitle = ""
                        }
                    }
                }
            }
        }
       else {
            addPostVM.savePost(url: nil) { (error) in
                addPostVM.postTitle = ""
            }
        }
        
    }
    
    func ShowPhotoLibrary() {
      sourceType = .photoLibrary
        self.showImagePicker = true
       
    }
    func showCamera() {
         sourceType = .camera
        self.showImagePicker = true
        
    }
    
    var toolbarItems:[KeyboardToolbarItem]  {
        return [
            .init(image: Image(systemName: "photo"), callback: { ShowPhotoLibrary()}),
            .init(image: Image(systemName: "camera"), callback: { showCamera() }),
            .init(image: Image(systemName: "paperplane"), callback: {}),
          
            .dismissKeyboard
        ]
    }
    
    
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
   
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators:false) {
                VStack() {
                    HStack {
                        Image("5")
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 40, maxWidth: 50, minHeight: 40, maxHeight: 50)
                            .clipShape(Circle())
                            .padding(2)
                        
                        Text("Madhav raj verma")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Spacer(minLength: 0)
                    }.padding(.horizontal,5)
                    VStack {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color(UIColor.secondarySystemBackground))
                            
                            if addPostVM.postTitle.isEmpty {
                                Text("Whats' on your mind")
                                    .foregroundColor(Color(UIColor.placeholderText))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 12)
                            }
                            
                            TextEditor(text: $addPostVM.postTitle)
                            
                            
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                        .font(.body)
                    }
                    
                    VStack(alignment:.center) {
                        if originalImage != nil {
                            Image(uiImage: originalImage ?? UIImage(systemName:"photo")! )
                                                .resizable()
                                                .scaledToFit()
                                                .frame(minWidth:100 , maxWidth: 150, minHeight: 150, maxHeight: 200)
                                .border(Color.gray)
                                .clipped()
                        }
                        }
                    //   Spacer(minLength: 0)
                    
                }.padding(4)
                
            }
           
            .navigationBarTitle("New Post",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                savePost()
                PostListVM.getAllPost{
                    
                }
            }) {
                Text("Post")
                
            })
            .keyboardToolbar(toolbarItems,style: .contrast)
            
            .onTapGesture {
                hideKeyboard()
            }
            
            
        }.fullScreenCover(isPresented: $showImagePicker) {
            ImagePicker(isShown: self.$showImagePicker, originalImage: self.$originalImage, sourceType: sourceType)
        }
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
    }
}



