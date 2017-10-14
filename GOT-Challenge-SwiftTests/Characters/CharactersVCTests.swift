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
        let tableview = tester().waitForView(withAccessibilityLabel: "CharactersTableView")
        expect(self.numberOfElementesInCharactersTableView()).to(equal(characters.count))
    }

    func testDetailVCOnCharacterTapped(){
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
        (){
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

        characters.forEach{
            let characterCell = tester().waitForView(withAccessibilityLabel: $0.name) as! CharacterTableViewCell
            expect(characterCell.nameLabel.text).to(equal($0.name))
        }

    }

    fileprivate func givenThereAreCharacters(numberOfCharacters: Int =  10) -> [GOT_Challenge_Swift.Character]{
        var characters: [GOT_Challenge_Swift.Character] = []
        for i in 0..<numberOfCharacters{
            let description = "Description \(i)"
            let character = GOT_Challenge_Swift.Character(id: "\(i)", name: "Character \(i)", description: description, image: URL(string: "https://geekandsundry.com/wp-content/uploads/2016/04/thronesposter.jpg")!)
            characters.append(character)
        }
        apiClient.characters = characters
        return characters
    }

    fileprivate func openCharactersVC() {
        _ = ServiceLocator.config(apiClient)
        let charactersVC = ServiceLocator().provideCharactersViewController()
        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [charactersVC]
        present(viewController: rootViewController)
        tester().waitForAnimationsToFinish()
    }

    func numberOfElementesInCharactersTableView() -> Int {
        let tableView = tester().waitForView(withAccessibilityLabel: "CharactersTableView") as! UITableView
        return tableView.numberOfRows(inSection: 0)
    }

    //Generates a random number between 0 and N-1
    func getRandomCellNumberInTableViewBounds() -> Int {
        return Int(arc4random_uniform(UInt32(numberOfElementesInCharactersTableView())))
    }


}
