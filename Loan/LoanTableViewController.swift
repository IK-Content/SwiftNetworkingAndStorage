
//
//  LoanTableViewController.swift
//  Loan
//
//  Created by Maverick Emamdie

import UIKit

class LoanTableViewController: UITableViewController {

    private let kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    private var loans = [Loan]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
