//
//  ResultsVCTests.swift
//  WordsTests
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import XCTest
@testable import Words

class ResultsVCTests: XCTestCase {
    
    var sut: ResultsVC!
    var tableView: UITableView!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: ResultsVC.self))
        sut.loadViewIfNeeded()
        
        tableView = sut.tableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertNotNil(sut.tableView.delegate)
    }

    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
}
