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

    init(view: DetailsView, character: Character){
        self.view = view
        self.character = character
    }
    func viewDidLoad() {
        view?.showDetails(forCharacter: character)
    }
}
