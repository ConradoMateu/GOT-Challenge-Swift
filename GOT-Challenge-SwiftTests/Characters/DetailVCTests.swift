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
class DetailVCTests: KIFTestCase {

    func testShowsCharacterNameAsTitle() {
        let character = CharactersGenerator.with()
        openDetailVC(character)
        tester().waitForView(withAccessibilityLabel: character.name)
    }

    func testShowsCharacterDescription() {
        let character = CharactersGenerator.with()
        openDetailVC(character)
        tester().waitForView(withAccessibilityLabel: "Description: \(character.description!)")
    }

    func testShowsNoDescriptionIfCharacterDoesNotHave() {
        let character = CharactersGenerator.with(description: nil)
        openDetailVC(character)
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Description: \(String(describing: character.description))")
    }

    fileprivate func openDetailVC(_ character: GOT_Challenge_Swift.Character) {
        let detailVC = ServiceLocator().provideCharacterDetailViewController(forCharacter: character)
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [detailVC]
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
        tester().waitForAnimationsToFinish()
    }
}

