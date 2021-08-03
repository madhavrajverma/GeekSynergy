//
//  QuoteViewModel.swift
//  GeekSynergy
//
//  Created by Madhav Raj Verma on 7/25/21.
//

import Foundation
import SwiftUI



class QuoteViewModel {
    
    
    static func fetchQuote(completion:@escaping (Result<String,Error>) -> Void) {
        guard let url  = URL(string:"https://api.quotable.io/random")  else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resposne, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            if let data = data {
                let decoder = JSONDecoder()
                let quote =  try? decoder.decode(Quote.self, from: data)
                
                if let quote = quote {
                    DispatchQueue.main.async {
                        completion(.success(quote.content))
                    }
                }
                
            }
            
            
            
        }
        task.resume()
        
        
        
    }
    
}
