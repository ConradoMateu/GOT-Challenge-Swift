//
//  CharactersViewController.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 05/03/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    open var presenter: CharactersPresentation!

    var characters = [Character]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        presenter.viewDidLoad()
    }

    fileprivate func configureNavigationBarTitle() {
        title = "Game of Thrones Challenge"
    }

    fileprivate func configureNavigationBarBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func setUpView() {
        configureNavigationBarBackButton()
        configureNavigationBarTitle()
        configTableView()
    }

    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.sectionHeaderHeight = 0
        tableView.accessibilityIdentifier = "CharactersTableView"
        tableView.accessibilityLabel = "CharactersTableView"

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterTableViewCell
        let character = characters[(indexPath as NSIndexPath).row]
        cell?.configureForCharacter(character)
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCharacter(characters[indexPath.row])
    }

}
extension CharactersViewController: CharactersView {
    func showNoContentScreen() {
    }
    func showCharactersData(_ characters: [Character]) {
        self.characters = characters
    }
}
