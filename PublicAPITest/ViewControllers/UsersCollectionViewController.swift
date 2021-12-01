//
//  UsersCollectionViewController.swift
//  PublicAPITest
//
//  Created by timatika on 27.11.2021.
//

import UIKit

class UsersCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var dataUser: DataUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.userAPI.rawValue)
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataUser?.data.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as! UserCollectionViewCell

        let user = dataUser?.data[indexPath.item]
        cell.configure(with: user)
    
        return cell
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        return activityIndicator
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.parsingUsers(from: url) { dataUser in
            self.dataUser = dataUser
            self.collectionView.reloadData()
        }
            }
        }
    
// MARK: UICollectionViewFlowLayout
    
    extension UsersCollectionViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: UIScreen.main.bounds.width - 48, height: 150)
            
        }
        
    }


    
