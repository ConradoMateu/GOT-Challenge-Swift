//
//  DetailVCTests.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 18/06/2017.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import UIKit
import KIF
import Nimble
@testable import GOT_Challenge_Swift
class DetailVCTests: AcceptanceTestCase {

    var apiClient = MockCharactersRepository()

    func testShowsCharacterNameAsTitle() {
        let character = givenACharacter()
        openDetailVC(character)
        tester().waitForView(withAccessibilityLabel: character.name)
    }

    func testShowsCharacterDescription() {
        let character = givenACharacter()
        openDetailVC(character)
        tester().waitForView(withAccessibilityLabel: "Description: \(character.description!)")
    }

    func testShowsNoDescriptionIfCharacterDoNotHave(){
        let character = GOT_Challenge_Swift.Character(id: "1234", name: "ConradoMateuGisbert", description: nil, image: nil)
        openDetailVC(character)
        tester().waitForAbsenceOfView(withAccessibilityLabel:  "Description: \(String(describing: character.description))")
    }

    fileprivate func givenACharacter() -> GOT_Challenge_Swift.Character{
        let character = GOT_Challenge_Swift.Character(id: "1234", name: "Conrado Mateu Gisbert", description: "Lorem Ipsum", image: nil)
        apiClient.characters = [character]
        return character
    }
    
    fileprivate func openDetailVC(_ character: GOT_Challenge_Swift.Character) {
        _ = ServiceLocator.config(apiClient: apiClient)
        let detailVC = ServiceLocator().provideCharacterDetailViewController(forCharacter: character)
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [detailVC]
        present(viewController: rootViewController)
        tester().waitForAnimationsToFinish()
    }


}

