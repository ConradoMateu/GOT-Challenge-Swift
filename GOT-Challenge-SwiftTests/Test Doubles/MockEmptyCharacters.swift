//
//  MockEmptyCharacters.swift
//  GOT-Challenge-SwiftTests
//
//  Created by Conrado Mateu Gisbert on 20/10/2017.
//  Copyright © 2017 conradomateu. All rights reserved.
//


import Foundation
import Result
@testable import GOT_Challenge_Swift

class MockEmptyCharacters: CharactersAPIClient {

    var characters: [GOT_Challenge_Swift.Character]

    init() {
        characters = []
    }
    func getAllCharacters(_ completion: @escaping (Result<[GOT_Challenge_Swift.Character], CharactersError>) -> Void) {
        delay(0.4) {completion(Result(self.characters))
        }
    }

}

