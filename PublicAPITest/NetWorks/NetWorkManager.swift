//
//  NetWorkManager.swift
//  PublicAPITest
//
//  Created by timatika on 27.11.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func parsingUsers(from url: String?, completion: @escaping(DataUser) -> Void) {
         guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "no description")
                return
            }
            
            do {
                let usersParsing = try JSONDecoder().decode(DataUser.self, from: data)
                DispatchQueue.main.async {
                    completion((usersParsing))
                }
            } catch let error{
              print(error)
            }
        }.resume()
    }
}
