//
//  CharactersPresenter.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 19/04/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation

class CharactersPresenter: CharactersPresentation{
    var view: CharactersView!
    var interactor: CharactersUseCase?
    var router: CharactersWireframe?
    var characters = [Character](){
        didSet {
            characters.count > 0 ? view?.showCharactersData(characters) : view?.showNoContentScreen()
        }
    }

    init(view: CharactersViewController, router: CharactersRouter) {
        self.view = view
        self.router = router
    }
    
    func didSelectCharacter(_ character: Character){
        router!.presentDetails(forCharacter: character)
    }

    func viewDidLoad() {
        view?.showActivityIndicator()
        initialize()
    }

    func initialize(){
        self.interactor = ServiceLocator().provideCharactersInteractor(output: self)
        interactor?.fetchCharacters()
    }
}

extension CharactersPresenter: CharactersInteractorOutput{
    func charactersFetched(_ characters: [Character]) {
        self.characters = characters
        view?.hideActivityIndicator()
    }
    internal func charactersFetchFailed() {
        view?.showNoContentScreen()
        view?.hideActivityIndicator()
    }

}
