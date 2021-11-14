
//
//  LoanTableViewController.swift
//  Loan
//
//  Created by Maverick Emamdie

import UIKit

class LoanTableViewController: UITableViewController {

    var loans: [Loan] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(loans: [Loan]) {
        self.loans = loans
        
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.loans = []
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 92.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return loans.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LoanTableViewCell

        // Configure the cell...
        cell.nameLabel.text = loans[indexPath.row].name
        cell.countryLabel.text = loans[indexPath.row].location.country
        cell.useLabel.text = loans[indexPath.row].use
        cell.amountLabel.text = "$\(loans[indexPath.row].loan_amount)"

        return cell
    }
}
