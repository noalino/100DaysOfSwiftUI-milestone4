//
//  Friend.swift
//  FriendFace
//
//  Created by Noalino on 04/12/2023.
//

import Foundation
import SwiftData

@Model
class Friend: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
