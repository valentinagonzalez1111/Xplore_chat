//
//  ProfilView.swift
//  Xplore_chat
//
//  Created by Apprenant 18 on 23/03/2023.
//

import SwiftUI

struct ProfilView: View {
    var person: Staff
    var body: some View {
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
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(person: Staff(person: "Val", photo: "person.circle.fill", color: .blue))
    }
}
