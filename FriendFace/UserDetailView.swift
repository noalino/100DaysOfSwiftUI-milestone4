//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Noalino on 05/12/2023.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

struct CustomDivider: View {
    var body: some View {
        Spacer()
        Divider()
        Spacer()
    }
}

struct UserDetailView: View {
    let user: User

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 5) {
                    Label {
                        Text(user.name)
                            .font(.title)
                    } icon: {
                        Image(systemName: "circle.fill")
                            .font(.caption)
                            .foregroundColor(user.isActive ? .green : .gray)
                    }
                    .labelStyle(TrailingIconLabelStyle())

                    Text("\(user.age)")

                    Spacer()

                    Text(user.address)

                    Text(user.email)

                    CustomDivider()

                    Text(user.about)
                }
                .padding()

                CustomDivider()
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.tags.indices, id: \.self) { index in
                            Text(user.tags[index])
                                .padding(5)
                                .background(.blue)
                                .foregroundColor(.white)
                                .clipShape(.rect(cornerRadius: 5))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }

                CustomDivider()
                    .padding(.horizontal)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Friends")
                        .font(.title2.bold())

                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
    }
}

#Preview {
    let friend = Friend(id: UUID(), name: "Toto")
    let user = User(id: UUID(), isActive: true, name: "Taylor Swift", age: 31, company: "My Little Company", email: "taylor.swift@apple.com", address: "Alley Road", about: "Lorem Ipsum", registered: .now, tags: ["pop", "country", "rock"], friends: [friend, friend])
    return UserDetailView(user: user)
}
