//
//  UsersCollectionViewController.swift
//  PublicAPITest
//
//  Created by timatika on 27.11.2021.
//

import UIKit

class UsersCollectionViewController: UICollectionViewController {

     var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingUsers()
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as! UserCollectionViewCell
        let user = users[indexPath.item]
       cell.configure(with: user)
        return cell
    }
}
    
// MARK: UICollectionViewFlowLayout
    
    extension UsersCollectionViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: UIScreen.main.bounds.width - 48, height: 150)
            
        }
        
    }


    
