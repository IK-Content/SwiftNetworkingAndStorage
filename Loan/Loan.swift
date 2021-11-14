//
//  Loan.swift
//  Loan
//
//  Created by Maverick Emamdie

import Foundation


struct Loans: Codable {
    var loans: [Loan]
}

struct Loan: Codable {
    
    var name: String = ""
    var use: String = ""
    var loan_amount: Int = 0
    var location: Location = Location()
    
    struct Location: Codable {
        var country: String = ""
    }
    
}
