//
//  ProfileViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/22.
//

import UIKit

class ProfileViewController: UIViewController {
  
    var backbtn: UIButton = {
       let backbtn = UIButton()
        backbtn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backbtn.frame = CGRect(x: 0, y: 0, width: 21, height: 17.5)
        backbtn.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        backbtn.translatesAutoresizingMaskIntoConstraints = false
        return backbtn
    }()
    
    var userName: UILabel = {
       let userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    var userAge: UILabel = {
        let userAge = UILabel()
        userAge.translatesAutoresizingMaskIntoConstraints = false
        return userAge
    }()
    
    lazy var randomAgebutton: UIButton = {
            let randomAgebutton = UIButton()
        randomAgebutton.setTitleColor(.green, for: .normal)
        randomAgebutton.setTitle("chanag random age", for: .normal)
        randomAgebutton.addTarget(self, action: #selector(changeAge), for: .touchUpInside)
        randomAgebutton.translatesAutoresizingMaskIntoConstraints = false
            return randomAgebutton
        }()
        
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.userName.text = viewModel.userName
        self.userAge.text = String(viewModel.userAge)
        
        profileConfigureUI()
        backbtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
}

extension ProfileViewController {
    func profileConfigureUI() {
        view.addSubview(backbtn)
        view.addSubview(userName)
        view.addSubview(userAge)
        view.addSubview(randomAgebutton)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
            backbtn.widthAnchor.constraint(equalToConstant: 21),
            backbtn.heightAnchor.constraint(equalToConstant: 17.5),
            backbtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backbtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            userAge.centerXAnchor.constraint(equalTo: userName.centerXAnchor),
            userAge.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            
            randomAgebutton.centerXAnchor.constraint(equalTo: userAge.centerXAnchor),
            randomAgebutton.topAnchor.constraint(equalTo: userAge.bottomAnchor, constant: 20)
        ])
    }
   
    @objc func backBtnTapped() {
        self.dismiss(animated: true)
    }
    @objc
       func changeAge() {
           viewModel.userAge = Int.random(in: 0..<100)
       }
       
}

extension ProfileViewController: UserViewModelDelegate {
    func updateUserName(name: String) {
        DispatchQueue.main.async {
            self.userName.text = name
        }
    }
    
    func updateUserAge(age: Int) {
        DispatchQueue.main.async {
            self.userAge.text = String(age)
        }
    }
}
