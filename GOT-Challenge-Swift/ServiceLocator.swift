//
//  ServiceLocator.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 27/05/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import UIKit
import Foundation

class ServiceLocator {

    static var apiClient: CharactersAPIClient = FakeCharactersAPIClient()

    //MARK: RootVC

    func provideRootViewController() -> UIViewController {
        let view = ServiceLocator().provideCharactersViewController()
        return  UINavigationController(rootViewController: view)
    }

    //MARK: CharactersVC Module

    func provideCharactersViewController() -> CharactersViewController {
        let charactersViewController = ServiceLocator.getBoard("CharactersViewController") as! CharactersViewController
        let presenter = provideCharactersPresenter(view:
            charactersViewController)
        charactersViewController.presenter = presenter
        return charactersViewController
    }

    fileprivate func provideCharactersPresenter(view: CharactersViewController) -> CharactersPresenter {
        let router = provideCharacterRouter(viewController: view)
        return CharactersPresenter(view: view, router: router)
    }

    func provideCharacterRouter(viewController: CharactersViewController) -> CharactersRouter {
        return CharactersRouter(viewController: viewController)
    }

    func provideCharactersInteractor(output: CharactersInteractorOutput) -> CharactersInteractor {
        return CharactersInteractor(output: output, apiclient: ServiceLocator.apiClient)
    }

    //MARK: CharacterDetailVC Module

    func provideCharacterDetailViewController(forCharacter character: Character) -> CharacterDetailViewController {
        let characterDetailViewController = ServiceLocator.getBoard("CharacterDetailViewController") as! CharacterDetailViewController
        let presenter = provideCharacterDetailPresenter(forCharacter: character, view: characterDetailViewController
        )
        characterDetailViewController.presenter = presenter
        return characterDetailViewController
    }

    fileprivate func provideCharacterDetailPresenter(forCharacter character: Character, view: DetailsView) -> DetailsPresenter {
        return DetailsPresenter(view: view, character: character)
    }

    //MARK: ApiClient Configurator

    static func config(_ apiClient: CharactersAPIClient) {
        self.apiClient = apiClient
    }
}

extension ServiceLocator {
    static func getBoard(_ boardName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "GOT", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: boardName)
    }
}
