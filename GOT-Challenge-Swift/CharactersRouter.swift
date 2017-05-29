//
//  CharactersRouter.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 19/04/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import UIKit


class CharactersRouter: CharactersWireframe{
    var viewController: UIViewController!

    init(viewController: CharactersViewController) {
        self.viewController = viewController
    }

    func presentDetails(forCharacter character: Character) {
        let detailsModuleViewController = ServiceLocator().provideCharacterDetailViewController()
        viewController?.navigationController?.pushViewController(detailsModuleViewController, animated: true)
    }
}
