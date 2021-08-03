//
//  MessageListScreen.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 6/29/21.
//

struct Messsage {
    
    let messageId = UUID().uuidString
    let message:String
    let username:String
}





import SwiftUI
import Combine


struct MessageListScreen: View {
    
    @Environment(\.presentationMode)  var presentationMode: Binding<PresentationMode>
    let messages : [Messsage] = [
        
        Messsage(message: "Hii",username: "Madhav"),
        Messsage(message: "Hello",username: "Rajnish"),
        Messsage(message: "Hii",username: "Madhav"),
        Messsage(message: "Hello",username: "Rajnish"),
        Messsage(message: "Hii",username: "Madhav"),
        Messsage(message: "Hello",username: "Rajnish"),
        Messsage(message: "Hii",username: "Madhav"),
        Messsage(message: "Hello",username: "Rajnish"),
        Messsage(message: "Hii",username: "Madhav"),
        Messsage(message: "Hello",username: "Rajnish"),
        
    ]
    
    var btnBack : some View {
        Button(action:{
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 25))
                Text("Back")
                    .font(.caption)
                    .fontWeight(.light)
            }
        }
    }
    
    @State private var username:String = "Madhav"
    @State private var message: String = ""
    @State private var cancellable:AnyCancellable?

    var body: some View{
//        NavigationView {
                        
            VStack {
                ScrollView {
                    ScrollViewReader { scrollView in
                        VStack {

                            ForEach(messages,id: \.messageId) {
                                message in
                                HStack {
                                    if message.username == username {
                                        Spacer()
                                        MessageView(messageText: message.message, username: message.username, style: .primary)
                                    }else {
                                        MessageView(messageText: message.message, username: message.username, style: .secondary)
                                        Spacer()
                                    }
                                }.padding()
                                .id(message.messageId)
                            }

                        }.onAppear(perform: {

                                if messages.count > 0 {
                                    DispatchQueue.main.async {
                                        withAnimation {

                                            scrollView.scrollTo(messages[messages.endIndex - 1].messageId ,anchor:.bottom)

                                        }
                                    }
                                }



                        })
                    }
                }

                Spacer()

                HStack {
                    TextField("Write message here", text: $message)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {

//                        sendMessage()
                    }, label: {
                        Image(systemName: "paperplane.fill")
                    })
                }.padding()


                .background(Color(#colorLiteral(red: 0.9483042359, green: 0.9484629035, blue: 0.9482833743, alpha: 1)))
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
           
            .navigationBarItems(leading: btnBack)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Rajnish")
                            .font(.subheadline)
                        Text("Online")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }

            
            
        }
    }
//}


