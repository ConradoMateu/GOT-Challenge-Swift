//
//  MockCharactersAPIClient.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 09/03/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import Result
@testable import GOT_Challenge_Swift

class MockCharactersRepository: CharactersAPIClient {

    var characters: [GOT_Challenge_Swift.Character]

    init() {
        characters = [Character(
                        id: "94d9ad9",
                        name: "Sansa Stark",
                        description: "Sansa Stark is the second child of Eddard Stark and Catelyn Stark. She was born and raised in Winterfell, until leaving with her father and sister at the beginning of the series. She has a younger sister Arya Stark, two younger brothers Rickon Stark and Bran Stark, as well as an older brother Robb Stark and an older illegitimate half-brother, Jon Snow. Raised as a lady, Sansa is traditionally feminine. Sansa's interests are music, poetry, and singing. She strives to become like the heroines of romantic tales by attempting to find a prince, knight, or gentleman to fall in love with. Sansa pities her younger sister Arya who is so different from herself due to her strong passion for sword fighting. For a companion animal, she owns a direwolf named Lady.",
                        image: URL(string: "https://sm.ign.com/ign_latam/screenshot/default/c9lzmv4d3mgzpnyntz7s_rycw.jpg")),
                      Character(
                        id: "94d9ad9",
                        name: "Sansa Stark",
                        description: "Sansa Stark is the second child of Eddard Stark and Catelyn Stark. She was born and raised in Winterfell, until leaving with her father and sister at the beginning of the series. She has a younger sister Arya Stark, two younger brothers Rickon Stark and Bran Stark, as well as an older brother Robb Stark and an older illegitimate half-brother, Jon Snow. Raised as a lady, Sansa is traditionally feminine. Sansa's interests are music, poetry, and singing. She strives to become like the heroines of romantic tales by attempting to find a prince, knight, or gentleman to fall in love with. Sansa pities her younger sister Arya who is so different from herself due to her strong passion for sword fighting. For a companion animal, she owns a direwolf named Lady.",
                        image: URL(string: "https://avatars3.githubusercontent.com/u/16736700?v=3&s=400")),
                      Character(
                        id: "94d9ad9",
                        name: "Sansa Stark",
                        description: "Sansa Stark is the second child of Eddard Stark and Catelyn Stark. She was born and raised in Winterfell, until leaving with her father and sister at the beginning of the series. She has a younger sister Arya Stark, two younger brothers Rickon Stark and Bran Stark, as well as an older brother Robb Stark and an older illegitimate half-brother, Jon Snow. Raised as a lady, Sansa is traditionally feminine. Sansa's interests are music, poetry, and singing. She strives to become like the heroines of romantic tales by attempting to find a prince, knight, or gentleman to fall in love with. Sansa pities her younger sister Arya who is so different from herself due to her strong passion for sword fighting. For a companion animal, she owns a direwolf named Lady.",
                        image: URL(string: "https://avatars3.githubusercontent.com/u/16736700?v=3&s=400")),
                      Character(
                        id: "94d9ad9",
                        name: "Sansa Stark",
                        description: "Sansa Stark is the second child of Eddard Stark and Catelyn Stark. She was born and raised in Winterfell, until leaving with her father and sister at the beginning of the series. She has a younger sister Arya Stark, two younger brothers Rickon Stark and Bran Stark, as well as an older brother Robb Stark and an older illegitimate half-brother, Jon Snow. Raised as a lady, Sansa is traditionally feminine. Sansa's interests are music, poetry, and singing. She strives to become like the heroines of romantic tales by attempting to find a prince, knight, or gentleman to fall in love with. Sansa pities her younger sister Arya who is so different from herself due to her strong passion for sword fighting. For a companion animal, she owns a direwolf named Lady.",
                        image: URL(string: "https://avatars3.githubusercontent.com/u/16736700?v=3&s=400"))
        ]
        
    }
    func getAllCharacters(_ completion: @escaping (Result<[GOT_Challenge_Swift.Character], CharactersError>) -> Void) {
        delay(0.4){completion(Result(self.characters))}
    }
    fileprivate func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }



}
