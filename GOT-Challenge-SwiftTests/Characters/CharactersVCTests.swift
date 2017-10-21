//
//  CharactersVCTests.swift
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
class CharactersVCTests: KIFTestCase {
    
    var apiClient: CharactersAPIClient?

    func testDoNotShowLoadingViewWhenThereAreCharacters() {
        _ = givenThereAreCharacters()
        openCharactersVC()
        tester().waitForAbsenceOfView(withAccessibilityLabel: "LoadingView")
    }

    func testShowsTheExactNumberOfCharacters() {
        let characters = givenThereAreCharacters()
        openCharactersVC()
        let tableview = tester().waitForView(withAccessibilityLabel: "CharactersTableView")
        expect(self.numberOfElementesInCharactersTableView()).to(equal(characters.count))
    }

    func testDetailVCOnCharacterTapped() {
        let characters = givenThereAreCharacters()
        openCharactersVC()
        tester().waitForView(withAccessibilityLabel: "CharactersTableView")
        let characterIndex = getRandomCellNumberInTableViewBounds()
        let currentCharacter = characters[characterIndex]
        tester().waitForView(withAccessibilityLabel: currentCharacter.name)
        tester().tapRow(at: IndexPath(row: characterIndex, section: 0), inTableViewWithAccessibilityIdentifier: "CharactersTableView")
        tester().waitForView(withAccessibilityLabel: currentCharacter.name)
    }

    func testDetailVCOnCharactersTapped
        () {
        let characters = givenThereAreCharacters()
        openCharactersVC()
        for (index, element) in characters.enumerated() {
            tester().waitForView(withAccessibilityLabel: element.name)
            tester().tapRow(at: IndexPath(row: index, section: 0), inTableViewWithAccessibilityIdentifier: "CharactersTableView")
            tester().waitForView(withAccessibilityLabel: element.name)
            UIApplication.shared.keyWindow?.rootViewController = ServiceLocator().provideRootViewController()
        }
    }

    func testShowsCharactersNames() {
        let characters = givenThereAreCharacters()
        openCharactersVC()
        characters.forEach {
            let characterCell = tester().waitForView(withAccessibilityLabel: $0.name) as! CharacterTableViewCell
            expect(characterCell.nameLabel.text).to(equal($0.name))
        }
    }

    fileprivate func openCharactersVC() {
        _ = ServiceLocator.config(apiClient!)
        UIApplication.shared.keyWindow?.rootViewController = ServiceLocator().provideRootViewController()
        tester().waitForAnimationsToFinish()
    }

    fileprivate func numberOfElementesInCharactersTableView() -> Int {
        let tableView = tester().waitForView(withAccessibilityLabel: "CharactersTableView") as! UITableView
        return tableView.numberOfRows(inSection: 0)
    }

    //Generates a random number between 0 and N-1
    fileprivate func getRandomCellNumberInTableViewBounds() -> Int {
        return Int(arc4random_uniform(UInt32(numberOfElementesInCharactersTableView())))
    }

    fileprivate func givenThereAreNoCharacters() -> [GOT_Challenge_Swift.Character] {
        let newApiClient = MockEmptyCharacters()
        self.apiClient = newApiClient
        return newApiClient.characters
    }

    fileprivate func givenThereAreCharacters() -> [GOT_Challenge_Swift.Character] {
        let newApiClient = MockCharactersRepository()
        self.apiClient = newApiClient
        return newApiClient.characters
    }

}
