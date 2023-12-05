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
            Label {
                Text(user.name)
            } icon: {
                Image(systemName: "circle.fill")
                    .font(.caption)
                    .foregroundColor(user.isActive ? .green : .gray)
            }
        }
        .task {
            await loadUsers()
        }
    }

    func loadUsers() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let decodedUsers = try? decoder.decode([User].self, from: data) {
                users = decodedUsers
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
