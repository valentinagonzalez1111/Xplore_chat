//
//  UsersView.swift
//  Xplore_chat
//
//  Created by Apprenant 18 on 22/03/2023.
//

import SwiftUI

struct ChatPrivate: View {
    @State private var messageText = ""
    @State private var messages = [Message]()
    var person: Staff
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    ProfilView(person: Staff(person: "asd", photo: "person.circle.fill", color: .gray))
                } label: {
                    VStack {
                        Image(systemName: person.photo)
                            .resizable()
                            .frame(width: 90, height: 90)
                            .foregroundColor(person.color)
                        Text("Voir profil")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(10)
                }
                VStack {
                    Image("profilpic")
                        .resizable()
                        .frame(width: 90, height: 60)
                        .clipShape(Circle())
                    Text("User Name")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                List {
                    ForEach(messages) { message in
                        HStack {
                            if message.isSender {
                                Spacer()
                            }
                            Text(message.text)
                                .padding(10)
                                .foregroundColor(.white)
                                .background(message.isSender ? Color.blue : Color.white)
                                .cornerRadius(10)
                            if !message.isSender {
                                Spacer()
                            }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white)
                        )
                        .padding(5)
                    }
                }
                .listStyle(PlainListStyle())
                HStack {
                    TextField("Write a message", text: $messageText)
                        .padding(.horizontal)
                    
                    Button(action: {
                        let newMessage = Message(text: messageText, timestamp: Date(), isSender: true)
                        messages.append(newMessage)
                        messageText = ""
                    }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                }
                .frame(height: 50)
                .background(Color.gray.opacity(0.2))
            }
            .padding(.bottom, 20)
        }
 
    }
    struct Message: Identifiable {
        let id = UUID()
        let text: String
        let timestamp: Date
        let isSender: Bool
    }
    
}
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        ChatPrivate(person: Staff(person: "person", photo: "person.circle.fill", color: .green))
    }
}
