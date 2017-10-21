//
//  CharactersAPIClient.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 05/03/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import Result

protocol CharactersAPIClient {
    func getAllCharacters (_  completion: @escaping (Result<[Character], CharactersError>) -> Void)
}

extension CharactersAPIClient {
    func delay(_ delay: Double, closure: @escaping ()->Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }
}
