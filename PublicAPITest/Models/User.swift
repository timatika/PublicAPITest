//
//  User.swift
//  PublicAPITest
//
//  Created by timatika on 27.11.2021.
//

import Foundation

struct DataUser: Decodable {
    let data: [User]
}

struct User: Decodable {
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}

enum Link: String {
    case userAPI = "https://reqres.in/api/users?delay=3"
}

