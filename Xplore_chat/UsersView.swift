//
//  UsersView.swift
//  Xplore_chat
//
//  Created by Apprenant 18 on 22/03/2023.
//

import SwiftUI

struct UsersView: View {
    var person: Staff
    var body: some View {
        Image(systemName: person.photo)
            .resizable()
            .frame(width: 120, height: 120)
            .foregroundColor(person.color)
      
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(person: Staff(person: "person", photo: "person.circle.fill", color: .green))
    }
}
