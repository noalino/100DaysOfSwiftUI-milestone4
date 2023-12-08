//
//  ContentView.swift
//  FriendFace
//
//  Created by Noalino on 03/12/2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    @State private var isLoadingData = false

    var body: some View {
        NavigationStack {
            List(users) { user in
                Label {
                    NavigationLink(user.name, destination: UserDetailView(user: user))
                } icon: {
                    Image(systemName: "circle.fill")
                        .font(.caption)
                        .foregroundColor(user.isActive ? .green : .gray)
                }
            }
            .task {
                if users.count == 0 {
                    await loadUsers()
                }
            }
            .navigationTitle("FriendFace")
            .navigationBarTitleDisplayMode(.inline)
            .opacity(isLoadingData ? 0 : 1)
        }
    }

    func loadUsers() async {
        isLoadingData = true

        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let decodedUsers = try? decoder.decode([User].self, from: data) {
                for decodedUser in decodedUsers {
                    modelContext.insert(decodedUser)
                }
            }
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }

        isLoadingData = false
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
