//
//  CharactersInteractor.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 19/04/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation

class CharactersInteractor: CharactersUseCase {
    var output: CharactersInteractorOutput!
    var apiclient: CharactersAPIClient!

    init(output: CharactersInteractorOutput, apiclient: CharactersAPIClient) {
        self.output = output
        self.apiclient = apiclient
    }

    func fetchCharacters() {
        apiclient.getAllCharacters { result in
            switch result {
            case .success(let characters):
                self.output?.charactersFetched(characters)
                break
            case .failure( _):
                self.output?.charactersFetchFailed()
                break

            }
        }
    }
}
