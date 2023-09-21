//
//  ProfileViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userName: UILabel = {
       let userName = UILabel()
        userName.text = "userName"
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    var userAge: UILabel = {
        let userAge = UILabel()
        userAge.text = "userAge"
        userAge.translatesAutoresizingMaskIntoConstraints = false
        return userAge
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileConfigureUI()
    }
}

extension ProfileViewController {
    func profileConfigureUI() {
        view.addSubview(userName)
        view.addSubview(userAge)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            userAge.centerXAnchor.constraint(equalTo: userName.centerXAnchor),
            userAge.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20)
        ])
    }
}
