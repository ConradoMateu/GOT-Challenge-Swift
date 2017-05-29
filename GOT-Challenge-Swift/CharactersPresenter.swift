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
    weak var interactor: CharactersUseCase?
    weak var router: CharactersWireframe?
    var characters = [Character](){
        didSet {
            characters.count > 0 ? view?.showCharactersData(characters) : view?.showNoContentScreen()
        }
    }

    init(view: CharactersViewController) {
        self.view = view
    }
    
    func didSelectCharacter(_ character: Character){
        router?.presentDetails(forCharacter: character)
    }

    func viewDidLoad() {
        view?.showActivityIndicator()

        initializeRouter()
        

        ServiceLocator().provideCharactersInteractor(output: self).fetchCharacters()
    }

    func initializeRouter(){
        self.router = ServiceLocator().provideCharacterRouter(viewController: view as! CharactersViewController)
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
