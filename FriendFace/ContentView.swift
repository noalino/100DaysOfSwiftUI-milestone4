//
//  ContentView.swift
//  FriendFace
//
//  Created by Noalino on 03/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()

    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text(user.isActive ? "Online" : "Offline")
            }
        }
    }
}

#Preview {
    ContentView()
}
