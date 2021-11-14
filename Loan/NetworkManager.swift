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
    
    func fetchLoanData(completion: @escaping ([Loan]) -> Void) {
        let decoder = JSONDecoder()

        guard let loanUrl = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: loanUrl) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try decoder.decode(Loans.self, from: data)
                completion(decoded.loans)
            } catch (let error) {
                print("Failed to decode JSON: \n \(error)")
            } catch {
                print("nil error")
            }
        }
        
        task.resume()
    }
}
