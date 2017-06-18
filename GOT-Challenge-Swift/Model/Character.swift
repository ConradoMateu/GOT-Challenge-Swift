//
//  Character.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 05/03/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import ObjectMapper

struct Character {
    var id: String = ""
    var name: String = ""
    var description: String?
    var image: URL?
    var formalDescription: String {
        get {
            return "\(name) - \(description ?? "No description provided.")"
        }
    }
}

extension Character: Mappable {
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id              <- map["title"]
        name            <- map["name"]
        description     <- map["description"]
        image           <- (map["imageUrl"], URLTransform())
    }
}
