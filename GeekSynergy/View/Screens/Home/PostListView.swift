//
//  PostListView.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/29/21.
//

import SwiftUI



struct PostListView: View {
    
    let postVM :PostViewModel
    var body: some View {
        VStack {
            VStack (alignment:.leading) {
                HStack {
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 40, maxWidth: 50, minHeight: 40, maxHeight: 50)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.white,lineWidth: 2))

                    
                    VStack(alignment:.leading) {
                        Text(postVM.name)
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        
                        Text(postVM.desingnation)
                            .font(.caption2)
                            .fontWeight(.light)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button (action :{}) {
                        HStack {
                           Label("Collab", systemImage: "plus")
                            .font(.body)
                            .labelStyle(BackgroundLabelStyle())
                            
                        }.padding(0)
                    }
                }.padding(.horizontal,5)
                
                Text(postVM.postTitle)
                    
                    .kerning(1)
                    .font(.caption)
                    .fontWeight(.regular)
                    .lineSpacing(3)
                    .padding(.horizontal,5)
                    .lineLimit(2)
                    
            }
            .padding(.horizontal,5)
                ImageWithURL(postVM.postImage)
        Divider()
            LikeCommentView()
          
            
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
       
    }
}




#if def

struct PostListView_Previews: PreviewProvider {
    

    static var previews: some View {
        PostListView(postVM: PostViewModel(post: post))
            .previewLayout(.sizeThatFits)
    }
}

#endif

struct BackgroundLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding(0)
            
    }
}



