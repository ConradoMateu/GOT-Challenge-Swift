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
        presenter.view = charactersViewController
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

        let router = self.provideCharacterRouter(view: view)
        let presenter = CharactersPresenter()
        let interactor = self.provideCharactersInteractor(presenter: presenter)

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router


        view.presenter = presenter

        return presenter
    }

    fileprivate func provideCharacterRouter(view: CharactersViewController) -> CharactersRouter {
        let router = CharactersRouter()
        router.viewController = view
        return router
    }

    fileprivate func provideCharactersInteractor(presenter: CharactersPresenter) -> CharactersInteractor {
        let interactor = CharactersInteractor()
        interactor.output = presenter
        return interactor
    }
}
