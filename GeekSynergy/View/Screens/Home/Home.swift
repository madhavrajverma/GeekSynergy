//
//  Home.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/26/21.
//

import SwiftUI

struct Home: View {
    @State private var shownMessageScreen:Bool = false
    @StateObject private var postListVM = PostListViewModel()
    
    @State private var quote:String = ""
    
    
   
    var body: some View {
        NavigationView {
          
            VStack {
                
                ScrollView(.vertical,showsIndicators:false) {
                    VStack {
                        VStack {
                            Text("Daily Motivation")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.vertical,5)
                                
                            Text(quote).font(.caption)
                                .fontWeight(.medium)
                        }
                    
                        ForEach(postListVM.posts,id:\.id) { post in
                        Divider()
                            
                            if postListVM.loadingState == .loading {
                                PostListView(postVM: post).redacted(reason: .placeholder)
                            }else {
                                PostListView(postVM: post)
                            }
                            
                         

                        }
   
                }
                   
            }
            }
                
//                .navigationBarColor(UIColor(Color("Color1")))
                
            .navigationBarTitle("GeekSynergy",displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {  shownMessageScreen = true }) {
                    Image(systemName: "message")
                        .font(.system(size: 25))
                })
             
        }
        .onAppear {
            postListVM.getAllPost {
                
            }
            QuoteViewModel.fetchQuote { (result) in
                switch result {
                    case .success(let quote):
                        self.quote = quote
                    case .failure(let error):
                        print(error)
                }
            
            }
    
        }
        .fullScreenCover(isPresented: $shownMessageScreen, content: {
            SegmentedControl()
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}







//struct NavigationBarModifier: ViewModifier {
//        
//    var backgroundColor: UIColor?
//    
//    init( backgroundColor: UIColor?) {
//        self.backgroundColor = backgroundColor
//        let coloredAppearance = UINavigationBarAppearance()
//        coloredAppearance.configureWithTransparentBackground()
//        coloredAppearance.backgroundColor = .clear
//        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        
//        UINavigationBar.appearance().standardAppearance = coloredAppearance
//        UINavigationBar.appearance().compactAppearance = coloredAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//        UINavigationBar.appearance().tintColor = .white
//
//    }
//    
//    func body(content: Content) -> some View {
//        ZStack{
//            content
//            VStack {
//                GeometryReader { geometry in
//                    Color(self.backgroundColor ?? .clear)
//                        .frame(height: geometry.safeAreaInsets.top)
//                        .edgesIgnoringSafeArea(.top)
//                    Spacer()
//                }
//            }
//        }
//    }
//}
//
//
//extension View {
// 
//    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
//        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
//    }
//
//}
