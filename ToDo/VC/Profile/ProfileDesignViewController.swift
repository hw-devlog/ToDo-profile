//
//  ProfileDesignViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/20.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProfileDesignViewController: UIViewController {
    
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
        userName.textAlignment = .center
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.frame = CGRect(x: 0, y: 0, width: 97, height: 25)
        userName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userName.font = UIFont(name: "OpenSans-Bold", size: 18)
        userName.text = "naebacamp"
        userName.sizeToFit()
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
    
    var userId: UILabel = {
        let userId = UILabel()
        userId.frame = CGRect(x: 0, y: 0, width: 38, height: 19)
        userId.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        userId.font = UIFont(name: "OpenSans-Bold", size: 14)
        userId.attributedText = NSMutableAttributedString(string: "르탄이", attributes: [NSAttributedString.Key.kern: -0.5])
        userId.sizeToFit()
        userId.translatesAutoresizingMaskIntoConstraints = false
        return userId
    }()
    
    var userIntro: UILabel = {
        let userIntro = UILabel()
        userIntro.frame = CGRect(x: 0, y: 0, width: 345, height: 19)
        userIntro.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        userIntro.font = UIFont(name: "OpenSans-Regular", size: 14)
        userIntro.attributedText = NSMutableAttributedString(string: "iOS Developer 🍎", attributes: [NSAttributedString.Key.kern: -0.5])
        userIntro.sizeToFit()
        userIntro.translatesAutoresizingMaskIntoConstraints = false
    
        return userIntro
    }()
    
    var userDomain: UILabel = {
        let userDomain = UILabel()
        userDomain.frame = CGRect(x: 0, y: 0, width: 121, height: 19)
        userDomain.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        userDomain.font = UIFont(name: "OpenSans-Regular", size: 14)
        userDomain.attributedText = NSMutableAttributedString(string: "spartacodingclub.kr", attributes: [NSAttributedString.Key.kern: -0.5])
        userDomain.translatesAutoresizingMaskIntoConstraints = false
        userDomain.sizeToFit()
        return userDomain
    }()
    
    var followBtn: UIButton = {
       let followBtn = UIButton()
        followBtn.setTitle("Follow", for: .normal)
        followBtn.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        followBtn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        followBtn.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        followBtn.layer.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1).cgColor
        followBtn.layer.cornerRadius = 4
        followBtn.translatesAutoresizingMaskIntoConstraints = false
        return followBtn
    }()
    
    var messageBtn: UIButton = {
       let messageBtn = UIButton()
        messageBtn.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        messageBtn.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        messageBtn.layer.cornerRadius = 4
        messageBtn.layer.borderWidth = 1.5
        messageBtn.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        messageBtn.setTitle("Message", for: .normal)
        messageBtn.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        messageBtn.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        messageBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return messageBtn
    }()
    
    var moreBtn: UIButton = {
        let moreBtn = UIButton()
        moreBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        moreBtn.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        moreBtn.setImage(UIImage(named: "more"), for: .normal)
        moreBtn.translatesAutoresizingMaskIntoConstraints = false
        return moreBtn
    }()
    
    var divider: UIView = {
          let divider = UIView()
          divider.layer.borderColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1).cgColor
          divider.backgroundColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1)
        divider.translatesAutoresizingMaskIntoConstraints = false
          return divider
      }()

    var gridButton: UIButton = {
          let gridButton = UIButton()
          gridButton.frame = CGRect(x: 0, y: 0, width: 22.5, height: 22.5)
          gridButton.setImage(UIImage(named: "grid"), for: .normal)
          gridButton.translatesAutoresizingMaskIntoConstraints = false
          return gridButton
      }()
    
    var sectionIndicator: UIView = {
        let sectionIndicator = UIView()
        sectionIndicator.frame = CGRect(x: 0, y: 0, width: 124, height: 1)
        sectionIndicator.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        sectionIndicator.translatesAutoresizingMaskIntoConstraints = false
        return sectionIndicator
    }()
    
    var postCollectionView: UICollectionView = {
        let postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        postCollectionView.register(ProfileDesignViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return postCollectionView
    }()
    var bottomBar: UIView = {
       let bottomBar = UIView()
        bottomBar.layer.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1).cgColor
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        return bottomBar
    }()
    
    var bottomBtn: UIButton = {
        let bottomBtn = UIButton()
        bottomBtn.frame = CGRect(x: 0, y: 0, width: 22.5, height: 22.75)
        bottomBtn.setImage(UIImage(named: "profile"), for: .normal)
        bottomBtn.translatesAutoresizingMaskIntoConstraints = false
        return bottomBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
   
        profileConfiguerUI()
        itemConfiguerUI()
        backbtn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        bottomBtn.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
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
        view.addSubview(userId)
        view.addSubview(userIntro)
        view.addSubview(userDomain)
        view.addSubview(followBtn)
        view.addSubview(messageBtn)
        view.addSubview(moreBtn)
        view.addSubview(divider)
        view.addSubview(gridButton)
        view.addSubview(sectionIndicator)
        view.addSubview(postCollectionView)
        view.addSubview(bottomBar)
        view.addSubview(bottomBtn)
        
        NSLayoutConstraint.activate([
            backbtn.widthAnchor.constraint(equalToConstant: 21),
            backbtn.heightAnchor.constraint(equalToConstant: 17.5),
            backbtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backbtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            
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
            userFollower.bottomAnchor.constraint(equalTo: userFollowerSub.topAnchor),
            userFollower.topAnchor.constraint(equalTo: userFollowInfo.topAnchor),
            
            userFollowerSub.centerXAnchor.constraint(equalTo: userFollowInfo.centerXAnchor),
            userFollowerSub.bottomAnchor.constraint(equalTo: userFollowInfo.bottomAnchor),
            
            userFollowing.topAnchor.constraint(equalTo: userFollowInfo.topAnchor),
            userFollowing.bottomAnchor.constraint(equalTo: userFollowingSub.topAnchor),
            userFollowing.centerXAnchor.constraint(equalTo: userFollowingSub.centerXAnchor),
            
            userFollowingSub.trailingAnchor.constraint(equalTo: userFollowInfo.trailingAnchor),
            userFollowingSub.bottomAnchor.constraint(equalTo: userFollowInfo.bottomAnchor),
            
            userId.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 14),
            userId.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        
            userIntro.topAnchor.constraint(equalTo: userId.bottomAnchor, constant: 2),
            userIntro.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            userDomain.topAnchor.constraint(equalTo: userIntro.bottomAnchor, constant: 2),
            userDomain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),

            followBtn.widthAnchor.constraint(equalToConstant: 150),
            followBtn.heightAnchor.constraint(equalToConstant: 30),
            followBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            followBtn.topAnchor.constraint(equalTo: userDomain.bottomAnchor, constant: 11),
            
            
            messageBtn.widthAnchor.constraint(equalToConstant: 150),
            messageBtn.heightAnchor.constraint(equalToConstant: 30),
            messageBtn.leadingAnchor.constraint(equalTo: followBtn.trailingAnchor, constant: 8),
            messageBtn.topAnchor.constraint(equalTo: userDomain.bottomAnchor, constant: 11),
            
            
            moreBtn.widthAnchor.constraint(equalToConstant: 30),
            moreBtn.heightAnchor.constraint(equalToConstant: 30),
            moreBtn.leadingAnchor.constraint(equalTo: messageBtn.trailingAnchor, constant: 8),
            moreBtn.topAnchor.constraint(equalTo: userDomain.bottomAnchor, constant: 11),
            
            divider.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width),
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            divider.topAnchor.constraint(equalTo: followBtn.bottomAnchor, constant: 10),
            
            gridButton.widthAnchor.constraint(equalToConstant: 22.5),
            gridButton.heightAnchor.constraint(equalToConstant: 22.5),
            gridButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 8),
            gridButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            
            sectionIndicator.widthAnchor.constraint(equalToConstant: 124),
            sectionIndicator.heightAnchor.constraint(equalToConstant: 1),
            sectionIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sectionIndicator.topAnchor.constraint(equalTo: gridButton.bottomAnchor, constant: 10.5),
            
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor),
            postCollectionView.topAnchor.constraint(equalTo: sectionIndicator.bottomAnchor),
            
            bottomBar.heightAnchor.constraint(equalToConstant: 84),
            bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bottomBtn.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 19),
            bottomBtn.centerXAnchor.constraint(equalTo: bottomBar.centerXAnchor)
            
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func profileButtonTapped() {
        let user = User(name: "르탄", age: 27)
        let profilemodel = ProfileViewModel(user: user)
        let profileView = ProfileViewController(viewModel: profilemodel)
        profileView.modalPresentationStyle = .fullScreen
        self.present(profileView, animated: true)
    }
}

extension ProfileDesignViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  postCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProfileDesignViewCell else { return ProfileDesignViewCell() }
        
        cell.postImage.image = UIImage(systemName: "pencil")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let cellWidth = (postCollectionView.frame.width - 4) / 3
          return CGSize(width: cellWidth, height: cellWidth)
      }
      
      //위아래 간격
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 2
      }
      //좌우간격
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 2
      }
  }
    
    

