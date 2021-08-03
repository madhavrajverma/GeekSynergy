//
//  MessageScreen.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/29/21.
//

import SwiftUI


enum Selection: String , CaseIterable{
    
    case chat = "chat"
    case team = "team"
}


struct SegmentedControl :View {
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Color1"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isSearchScreen:Bool = false
    @State  private var selectedScreen: Selection = .chat
    
    var body: some View {
        NavigationView {
        VStack {
            Picker("", selection: $selectedScreen) {
                ForEach(Selection.allCases,id:\.self) {
                    Text($0.rawValue)
                }
            }.labelsHidden()
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            if selectedScreen == .chat {
                MessageScreen()
            } else if selectedScreen == .team  {
                RoomScreen()
            }
            
            
        }
//        .navigationBarColor(UIColor(Color("Color1")))
//            .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Messages",displayMode: .inline)
        .navigationBarItems(leading: Button(action :{
            presentationMode.wrappedValue.dismiss()
        }){
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 25))
                Text("Back")
                    .font(.caption)
                    .fontWeight(.light)
            }
        }, trailing:Button(action: {
              isSearchScreen = true
        }) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 25))
        })
    
    }.fullScreenCover(isPresented: $isSearchScreen, content: {
        SeacrhScreen(seacrchType: .SearchUser)
    })
    
    .gesture(
    DragGesture()
        .onEnded {
            value in
            if value.translation.width > 100 {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    )
}
}



struct MessageScreen: View {
 
    var body: some View {
            ScrollView(.vertical , showsIndicators:false) {
                ForEach(0..<10) { _ in
                    Divider()
                    NavigationLink(destination:MessageListScreen()) {
                        UserList()
                            .padding(5)

                    }
                    
                }
            }
}

}

struct MessageScreen_Previews: PreviewProvider {
    static var previews: some View {
        MessageScreen()
    }
}



struct UserList:View {
    
    var body: some View {
       
        HStack {
            Image("5")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 40, maxWidth: 50, minHeight: 40, maxHeight: 50)
                .clipShape(Circle())
                .padding(2)
                
                
            VStack(alignment:.leading) {
                Text("Rajnish Kumar")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Hii")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                
            }
            
            Spacer()
            Text("feb 5")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
        }
    }
}

    
struct UserSearchResult:View {
    
    let user:User
    
    var body: some View {
       
        HStack {
            Image("5")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 40, maxWidth: 50, minHeight: 40, maxHeight: 50)
                .clipShape(Circle())
                .padding(2)
                
                
            VStack(alignment:.leading) {
                Text(user.fullName ?? "")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(user.skills ?? "")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                
            }
            
            Spacer()
           
        }
    }
}


    
struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}


