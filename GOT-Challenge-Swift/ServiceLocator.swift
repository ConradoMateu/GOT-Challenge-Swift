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

    func provideCharacterDetailViewController() -> CharacterDetailViewController{
        let characterDetailViewController = R.storyboard.gOT.characterDetailViewController()
        let presenter = provideCharacterDetailPresenter()
        characterDetailViewController?.presenter = presenter
        return characterDetailViewController!
    }

    func provideApiClient() -> CharactersAPIClient {
        return RealCharactersAPIClient()
    }

    fileprivate func provideCharacterDetailPresenter() -> DetailsPresenter{
        let presenter = DetailsPresenter()
        let view = self.provideCharacterDetailViewController()
        presenter.view = view
        return presenter
    }

    fileprivate func provideCharactersPresenter(view: CharactersViewController) -> CharactersPresenter{
        return CharactersPresenter(view: view)
    }

    func provideCharacterRouter(viewController: CharactersViewController) -> CharactersRouter {
        return CharactersRouter(viewController: viewController)
    }

    func provideCharactersInteractor(output: CharactersInteractorOutput) -> CharactersInteractor {
        let apiclient = RealCharactersAPIClient()
        return CharactersInteractor(output: output, apiclient: apiclient)
    }
}
