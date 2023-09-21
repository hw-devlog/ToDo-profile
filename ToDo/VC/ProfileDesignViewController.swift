//
//  ProfileDesignViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/20.
//

import UIKit

class ProfileDesignViewController: UIViewController {
    
    var backbtn: UIButton = {
        let backbtn = UIButton()
        backbtn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backbtn.frame = CGRect(x: 0, y: 0, width: 21, height: 17.5)
        backbtn.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        backbtn.translatesAutoresizingMaskIntoConstraints = false
        backbtn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return backbtn
    }()
    
    var userName: UILabel = {
        let userName = UILabel()
        userName.textAlignment = .center
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.frame = CGRect(x: 0, y: 0, width: 97, height: 25)
        userName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userName.font = UIFont(name: "OpenSans-Bold", size: 18)
        userName.text = "naebacamp"
        
        return userName
    }()
    
    var menuImage: UIImageView = {
        let menuImage = UIImageView()
        menuImage.frame = CGRect(x: 0, y: 0, width: 21, height: 17.5)
        menuImage.image  = UIImage(named: "menu")
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        return menuImage
    }()
    
    var userImage: UIImageView = {
        let userImage = UIImageView()
        userImage.frame = CGRect(x: 0, y: 0, width: 88, height: 88)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.image = UIImage(named: "userImage")
        return userImage
    }()
    
    var userFollowInfo: UIView = {
        let userFollowInfo = UIView()
        userFollowInfo.translatesAutoresizingMaskIntoConstraints = false
        userFollowInfo.frame = CGRect(x: 0, y: 0, width: 204, height: 41)
        userFollowInfo.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        return userFollowInfo
    }()
    
    var userPost: UILabel = {
        let userPost = UILabel()
        userPost.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        userPost.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userPost.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        userPost.textAlignment = .center
        userPost.text = "7"
        userPost.translatesAutoresizingMaskIntoConstraints = false
        return userPost
    }()
    
    var userPostSub: UILabel = {
        let userPostSub = UILabel()
        userPostSub.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        userPostSub.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userPostSub.font = UIFont(name: "OpenSans-Regular", size: 14)
        userPostSub.textAlignment = .center
        userPostSub.attributedText = NSMutableAttributedString(string: "post", attributes: [NSAttributedString.Key.kern: -0.3])
        userPostSub.sizeToFit()
        userPostSub.translatesAutoresizingMaskIntoConstraints = false

        return userPostSub
    }()
    
    
    
    var userFollower: UILabel = {
        let userFollower = UILabel()
        userFollower.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        userFollower.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userFollower.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        // Line height: 22.47 pt
        userFollower.textAlignment = .center
        userFollower.text = "0"
        userFollower.translatesAutoresizingMaskIntoConstraints = false
        return userFollower
    }()
    
    var userFollowerSub: UILabel = {
        let userFollowerSub = UILabel()
        userFollowerSub.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        userFollowerSub.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userFollowerSub.font = UIFont(name: "OpenSans-Regular", size: 14)
        userFollowerSub.textAlignment = .center
        userFollowerSub.attributedText = NSMutableAttributedString(string: "Follower", attributes: [NSAttributedString.Key.kern: -0.3])
        userFollowerSub.sizeToFit()
        userFollowerSub.translatesAutoresizingMaskIntoConstraints = false

        return userFollowerSub
    }()
    
    
    
    var userFollowing: UILabel = {
        let userFollowing = UILabel()
        userFollowing.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        userFollowing.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userFollowing.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        // Line height: 22.47 pt
        userFollowing.textAlignment = .center
        userFollowing.text = "0"
        userFollowing.translatesAutoresizingMaskIntoConstraints = false
        return userFollowing
    }()
    
    var userFollowingSub: UILabel = {
        let userFollowingSub = UILabel()
        userFollowingSub.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        userFollowingSub.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userFollowingSub.font = UIFont(name: "OpenSans-Regular", size: 14)
        userFollowingSub.textAlignment = .center
        userFollowingSub.attributedText = NSMutableAttributedString(string: "Following", attributes: [NSAttributedString.Key.kern: -0.3])
        userFollowingSub.sizeToFit()
        userFollowingSub.translatesAutoresizingMaskIntoConstraints = false


        return userFollowingSub
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        profileConfiguerUI()
        itemConfiguerUI()
    }
}

extension ProfileDesignViewController {
    func profileConfiguerUI() {
    }
    
    func itemConfiguerUI() {
        view.addSubview(userName)
        view.addSubview(menuImage)
        view.addSubview(backbtn)
        view.addSubview(userImage)
        view.addSubview(userFollowInfo)
        userFollowInfo.addSubview(userPost)
        userFollowInfo.addSubview(userPostSub)
        userFollowInfo.addSubview(userFollower)
        userFollowInfo.addSubview(userFollowerSub)
        userFollowInfo.addSubview(userFollowing)
        userFollowInfo.addSubview(userFollowingSub)
        
        NSLayoutConstraint.activate([
            backbtn.widthAnchor.constraint(equalToConstant: 21),
            backbtn.heightAnchor.constraint(equalToConstant: 17.5),
            backbtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backbtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            
            userName.widthAnchor.constraint(equalToConstant: 97),
            userName.heightAnchor.constraint(equalToConstant: 25),
            userName.leadingAnchor.constraint(equalTo: backbtn.trailingAnchor, constant: 102),
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 54),
 
            menuImage.widthAnchor.constraint(equalToConstant: 21),
            menuImage.heightAnchor.constraint(equalToConstant: 17.5),
            menuImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            menuImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            
            userImage.widthAnchor.constraint(equalToConstant: 88),
            userImage.heightAnchor.constraint(equalToConstant: 88),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 93),
            
            userFollowInfo.widthAnchor.constraint(equalToConstant: 204),
            userFollowInfo.heightAnchor.constraint(equalToConstant: 41),
            userFollowInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 143),
            userFollowInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 116),
            
            userPost.topAnchor.constraint(equalTo: userFollowInfo.topAnchor),
            userPost.bottomAnchor.constraint(equalTo: userPostSub.topAnchor),
            userPost.centerXAnchor.constraint(equalTo: userPostSub.centerXAnchor),
            
            userPostSub.leadingAnchor.constraint(equalTo: userFollowInfo.leadingAnchor),
            userPostSub.bottomAnchor.constraint(equalTo: userFollowInfo.bottomAnchor),
            
            userFollower.centerXAnchor.constraint(equalTo: userFollowInfo.centerXAnchor),
            userFollower.topAnchor.constraint(equalTo: userFollowInfo.topAnchor),
            
            userFollowerSub.centerXAnchor.constraint(equalTo: userFollowInfo.centerXAnchor),
            userFollowerSub.topAnchor.constraint(equalTo: userFollower.bottomAnchor),
            
            userFollowing.topAnchor.constraint(equalTo: userFollowInfo.topAnchor),
            userFollowing.bottomAnchor.constraint(equalTo: userFollowingSub.topAnchor),
            userFollowing.centerXAnchor.constraint(equalTo: userFollowingSub.centerXAnchor),
            
            userFollowingSub.trailingAnchor.constraint(equalTo: userFollowInfo.trailingAnchor),
            userFollowingSub.bottomAnchor.constraint(equalTo: userFollowInfo.bottomAnchor)

        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
