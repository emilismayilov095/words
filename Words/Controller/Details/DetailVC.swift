//
//  DetailVC.swift
//  Words
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate   = self
            self.tableView.dataSource = self
        }
    }
    
    var result: SearchResponseElement?
    private var meanings = [Meaning]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI(with: result)
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Table View DataSource
extension DetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meanings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailCell.self),
                                                       for: indexPath) as? DetailCell else {return UITableViewCell()}
        cell.setupCell(with: meanings[indexPath.row])
        return cell
    }
}

// MARK: - Table View Delegate
extension DetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension DetailVC {
    func setupUI(with result: SearchResponseElement?) {
        if let result = result {
            self.resultLabel.text = result.text
            self.meanings = result.meanings
        }
    }
}
