//
//  ServiceLocator.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 27/05/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Rswift
import Foundation

class ServiceLocator {

    fileprivate func provideCharacterDetailPresenter(forCharacter character: Character, view: DetailsView) -> DetailsPresenter{
        return DetailsPresenter(view: view, character: character)
    }

    fileprivate func provideCharactersPresenter(view: CharactersViewController) -> CharactersPresenter{
        let router = provideCharacterRouter(viewController: view)
        return CharactersPresenter(view: view, router: router)
    }

    func provideRootViewController() -> UIViewController {
        let view = ServiceLocator().provideCharactersViewController()
        return  UINavigationController(rootViewController: view)
    }

    func provideCharactersViewController() -> CharactersViewController {
        let charactersViewController = R.storyboard.gOT.charactersViewController()
        let presenter = provideCharactersPresenter(view:
            charactersViewController!)
        charactersViewController?.presenter = presenter
        return charactersViewController!
    }

    func provideCharacterDetailViewController(forCharacter character: Character) -> CharacterDetailViewController{
        let characterDetailViewController = R.storyboard.gOT.characterDetailViewController()
        let presenter = provideCharacterDetailPresenter(forCharacter: character,view: characterDetailViewController!
        )
        characterDetailViewController?.presenter = presenter
        return characterDetailViewController!
    }

    func provideApiClient() -> CharactersAPIClient {
        return RealCharactersAPIClient()
    }

    func provideCharacterRouter(viewController: CharactersViewController) -> CharactersRouter {
        return CharactersRouter(viewController: viewController)
    }

    func provideCharactersInteractor(output: CharactersInteractorOutput) -> CharactersInteractor {
        let apiclient = RealCharactersAPIClient()
        return CharactersInteractor(output: output, apiclient: apiclient)
    }
}
