//
//  NetWorkManager.swift
//  PublicAPITest
//
//  Created by timatika on 27.11.2021.
//

import Foundation

extension UsersCollectionViewController {
     func parsingUsers() {
        guard let url = URL(string: "https://reqres.in/api/users?delay=3") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No parsing")
                return
            }
            do {
                let usersParsing = try JSONDecoder().decode(DataUser.self, from: data)
                self.users = usersParsing.data
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let error{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
