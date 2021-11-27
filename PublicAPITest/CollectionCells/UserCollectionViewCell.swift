//
//  UserCollectionViewCell.swift
//  PublicAPITest
//
//  Created by timatika on 27.11.2021.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    func configure(with user: User){
        firstName.text = user.first_name
        lastName.text = user.last_name
        email.text = user.email
        
        guard let stringURL = user.avatar else { return }
        guard let url = URL(string: stringURL) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: imageData)
        }
    }
}
