//
//  RealAPIClientManager.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 14/05/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import enum Result.Result
import ObjectMapper

class RealCharactersAPIClient: CharactersAPIClient {

    fileprivate let characters: [Character] = []

    let endPoint: String = "https://raw.githubusercontent.com/ConradoMateu/GOT-Challenge-Swift/master/GOT-Challenge-Swift/Resources/data.json"

    func getAllCharacters(_ completion: @escaping (Result<[Character], CharactersError>) -> Void) {

        Alamofire.request(endPoint).responseArray{ (response: DataResponse<[Character]>) in

            switch response.result {
            case .success:
                let characters = response.result.value!
                completion(Result(characters))
            case .failure :
                completion(Result(error: CharactersError.connectionError))
            }
            
        }

    }
}
