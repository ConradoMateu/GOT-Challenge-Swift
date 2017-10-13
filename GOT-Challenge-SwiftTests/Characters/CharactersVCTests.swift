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
class CharactersVCTests: AcceptanceTestCase {
    
    var apiClient = MockCharactersRepository()

    func testDoNotShowLoadingViewWhenThereAreCharacters(){
        _ = givenThereAreCharacters()
        openCharactersVC()
        tester().waitForAbsenceOfView(withAccessibilityLabel: "LoadingView")
    }

    fileprivate func givenThereAreNoCharacters() -> [GOT_Challenge_Swift.Character]{
        return givenThereAreCharacters(numberOfCharacters: 0)
    }

    func testShowsTheExactNumberOfCharacters() {
        let characters = givenThereAreCharacters()
        openCharactersVC()
        let tableview = tester().waitForView(withAccessibilityLabel: "CharactersTableView") as! UITableView
        expect(tableview.numberOfRows(inSection: 0)).to(equal(characters.count))
    }

    func testDetailVCOnCharactersTapped(){
        let characterIndex = 4
        let characters = givenThereAreCharacters()
        let currentCharacters = characters[characterIndex]
        openCharactersVC()
        tester().waitForView(withAccessibilityLabel: currentCharacters.name)
        tester().tapRow(at: IndexPath(row: characterIndex, section: 0), inTableViewWithAccessibilityIdentifier: "CharactersTableView")
        tester().waitForView(withAccessibilityLabel: currentCharacters.name)
    }

    func testDetailVCOnCharactersTappeddd
        (){

        let characters = givenThereAreCharacters()

        openCharactersVC()
        for i in 0..<characters.count{
            let currentCharacter = characters[i]
            tester().waitForView(withAccessibilityLabel: currentCharacter.name)
            tester().tapRow(at: IndexPath(row: i, section: 0), inTableViewWithAccessibilityIdentifier: "CharactersTableView")
            tester().waitForView(withAccessibilityLabel: currentCharacter.name)
            UIApplication.shared.keyWindow?.rootViewController = ServiceLocator().provideRootViewController()
        }

    }

    func testShowsCharactersNames() {
        let characters = givenThereAreCharacters()

        openCharactersVC()

        for i in 0..<characters.count {
            let characterCell = tester().waitForView(withAccessibilityLabel: characters[i].name) as! CharacterTableViewCell
            expect(characterCell.nameLabel.text).to(equal(characters[i].name))
        }
    }

    fileprivate func givenThereAreCharacters(numberOfCharacters: Int =  10) -> [GOT_Challenge_Swift.Character]{
        var characters: [GOT_Challenge_Swift.Character] = []
        for i in 0..<numberOfCharacters{
            let character = GOT_Challenge_Swift.Character(id: "\(i)", name: "Character \(i)", description: "Description \(i)", image: URL(string: "https://geekandsundry.com/wp-content/uploads/2016/04/thronesposter.jpg")!)
            characters.append(character)
        }
        apiClient.characters = characters
        return characters
    }
    fileprivate func openCharactersVC() {
        _ = ServiceLocator.config(apiClient: apiClient)
        let charactersVC = ServiceLocator().provideCharactersViewController()
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [charactersVC]
        present(viewController: rootViewController)
        tester().waitForAnimationsToFinish()
    }


}
