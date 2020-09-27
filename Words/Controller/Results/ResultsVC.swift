//
//  ViewController.swift
//  Words
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate   = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    var searchTexts = [SearchResponseElement]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailVC,
              let result = sender as? SearchResponseElement else {return}
        detailVC.result = result
    }

}

// MARK: - Table View DataSource
extension ResultsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ResultsCell.self),
                                                       for: indexPath) as? ResultsCell else {return UITableViewCell()}
        cell.setupCell(with: self.searchTexts[indexPath.row])
        return cell
    }
}

// MARK: - Table View Delegate
extension ResultsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetails", sender: self.searchTexts[indexPath.row])
    }
}

// MARK: - UISearchBarDelegate
extension ResultsVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.search(with: searchBar.text)
        view.endEditing(true)
    }
}

// MARK: - Network Extension
extension ResultsVC {
    func search(with text: String?) {
        guard let searchText = text else { return }
        NetworkManager.shared.search(with: searchText) { (result) in
            switch result {
            case .success(let response):
                self.searchTexts = response
                self.tableView.reloadData()
            case .failure(let error):
                self.showAlertWith(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
