//
//  MainChat.swift
//  }_chat
//
//  Created by Apprenant 18 on 22/03/2023.
//

import SwiftUI

struct MainChat: View {
    @State private var messageText = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack {
                        Text("Appuyez sur la photo d'un utilisateur pour parler en privée")
                            .foregroundColor(Color.gray)
                        
                            .padding(.top, 55.0)
                        Divider()
                    }
                    VStack {
                        Image("profilpic")
                            .resizable()
                            .frame(width: 125, height: 90)
                            .clipShape(Circle())
                        Text("User Name")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
                VStack {
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(.gray)
                        .padding(.leading, -190.0)
                        .padding(.bottom)
                    Text("Utilisateurs")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -190.0)
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader {value in
                            HStack{
                                ForEach(people) { user in
                                    NavigationLink(destination: UsersView(person: user)) {
                                        
                                        VStack {
                                            Image(systemName: user.photo)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .clipShape(Circle())
                                                .foregroundColor(user.color)
                                            Text(user.person)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    .padding(.horizontal, 7)
                                    .onAppear {
                                        value.scrollTo(people.last?.id)
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            HStack {
                TextField("Write a message", text: $messageText)
                    .padding(.horizontal)
                
                Button(action: {
                    print("Message sent: \(messageText)")
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
struct Staff: Identifiable {
    var id = UUID()
    var person: String
    var photo: String
    let color: Color
}

var people = [
    Staff(person: "Kev", photo: "person.circle.fill", color: .green),
    Staff(person: "Val", photo: "person.circle.fill", color: .yellow),
    Staff(person: "Chi", photo: "person.circle.fill", color: .purple),
    Staff(person: "Atm", photo: "person.circle.fill", color: .mint),
    Staff(person: "Val", photo: "person.circle.fill", color: .yellow),
    Staff(person: "Chi", photo: "person.circle.fill", color: .purple),
    Staff(person: "Atm", photo: "person.circle.fill", color: .mint),
    Staff(person: "Val", photo: "person.circle.fill", color: .yellow),
    Staff(person: "Chi", photo: "person.circle.fill", color: .purple),
    Staff(person: "Atm", photo: "person.circle.fill", color: .mint)
]

struct MainChat_Previews: PreviewProvider {
    static var previews: some View {
        MainChat()
    }
}


