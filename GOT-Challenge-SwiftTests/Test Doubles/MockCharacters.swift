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
                        name: "White Walker",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mattis, tortor placerat faucibus hendrerit, urna lacus feugiat ligula, vitae porta lorem magna dignissim lorem. Mauris eu risus vestibulum, egestas enim ac, egestas tellus. Etiam pharetra dictum elit nec vehicula. Nulla pulvinar quis dui sed volutpat. Nullam sollicitudin urna ac tortor pellentesque dignissim. Nam fringilla suscipit molestie. Suspendisse dolor quam, pharetra vitae ultrices ut, scelerisque a enim. Nunc eu ante at diam interdum finibus sit amet ut lectus.",
                        image: URL(string: "https://vignette.wikia.nocookie.net/gameofthrones/images/c/c7/WhiteWalkersHorseback.png/revision/latest?cb=20170823220942")),
                      Character(
                        id: "94d9ad9",
                        name: "Dragon",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mattis, tortor placerat faucibus hendrerit, urna lacus feugiat ligula, vitae porta lorem magna dignissim lorem. Mauris eu risus vestibulum, egestas enim ac, egestas tellus. Etiam pharetra dictum elit nec vehicula. Nulla pulvinar quis dui sed volutpat. Nullam sollicitudin urna ac tortor pellentesque dignissim. Nam fringilla suscipit molestie. Suspendisse dolor quam, pharetra vitae ultrices ut, scelerisque a enim. Nunc eu ante at diam interdum finibus sit amet ut lectus.",
                        image: URL(string: "https://vignette4.wikia.nocookie.net/gameofthrones/images/1/16/DrogonHD.jpg/revision/latest?cb=20140404211220")),
                      Character(
                        id: "94d9ad9",
                        name: "The Hound",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mattis, tortor placerat faucibus hendrerit, urna lacus feugiat ligula, vitae porta lorem magna dignissim lorem. Mauris eu risus vestibulum, egestas enim ac, egestas tellus. Etiam pharetra dictum elit nec vehicula. Nulla pulvinar quis dui sed volutpat. Nullam sollicitudin urna ac tortor pellentesque dignissim. Nam fringilla suscipit molestie. Suspendisse dolor quam, pharetra vitae ultrices ut, scelerisque a enim. Nunc eu ante at diam interdum finibus sit amet ut lectus.",
                        image: URL(string: "https://www.ecartelera.com/images/noticias/fotos/31600/31640/1.jpg")),
                      Character(
                        id: "94d9ad9",
                        name: "Davos Seaworth",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mattis, tortor placerat faucibus hendrerit, urna lacus feugiat ligula, vitae porta lorem magna dignissim lorem. Mauris eu risus vestibulum, egestas enim ac, egestas tellus. Etiam pharetra dictum elit nec vehicula. Nulla pulvinar quis dui sed volutpat. Nullam sollicitudin urna ac tortor pellentesque dignissim. Nam fringilla suscipit molestie. Suspendisse dolor quam, pharetra vitae ultrices ut, scelerisque a enim. Nunc eu ante at diam interdum finibus sit amet ut lectus.",
                        image: URL(string: "https://metrouk2.files.wordpress.com/2017/03/game-of-thrones-ser-davos.jpg"))
        ]

    }
    func getAllCharacters(_ completion: @escaping (Result<[GOT_Challenge_Swift.Character], CharactersError>) -> Void) {
        delay(0.4) {completion(Result(self.characters))
        }
    }

}
