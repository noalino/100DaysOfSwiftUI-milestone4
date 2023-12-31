//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Noalino on 03/12/2023.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
