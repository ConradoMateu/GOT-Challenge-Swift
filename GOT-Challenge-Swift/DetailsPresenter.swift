//
//  DetailsPresenter.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 19/04/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation

class DetailsPresenter: DetailsPresentation {
    open var view: DetailsView?
    var character: Character!

    func viewDidLoad() {
        view?.showDetails(forCharacter: character)
    }
}
