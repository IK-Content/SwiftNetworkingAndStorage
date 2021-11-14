//
//  NetworkManager.swift
//  Loan
//
//  Created by Maverick Emamdie on 11/13/21.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private let url = "https://api.kivaws.org/v1/loans/newest.json"
    static var loans = [Loan]()
    static var isRequestInFlight = false
    
    func fetchLoanData(completion: @escaping ([Loan]) -> Void) {
        
        let decoder = JSONDecoder()

        guard let loanUrl = URL(string: url), !NetworkManager.isRequestInFlight else {
            return
        }
        
        NetworkManager.isRequestInFlight = true
        URLSession.shared.dataTask(with: loanUrl) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decoded = try decoder.decode(Loans.self, from: data)
                
                NetworkManager.isRequestInFlight = false

                completion(decoded.loans)
            } catch (let error) {
                print("Failed to decode JSON: \n \(error)")
                NetworkManager.isRequestInFlight = false

            }
        }.resume()
    }
}
