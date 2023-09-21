//
//  ProfileDesignViewCell.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/21.
//

import UIKit


class ProfileDesignViewCell: UICollectionViewCell {
    
    var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleToFill
        postImage.translatesAutoresizingMaskIntoConstraints = false
        return postImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileDesignViewCell {
    func setupCell() {
        self.backgroundColor = .gray
        self.addSubview(postImage)
        
        
        NSLayoutConstraint.activate([
            postImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            postImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            postImage.topAnchor.constraint(equalTo: self.topAnchor),
            postImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}
