//
//  todolistTableViewCell.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class tdlTableCell: UITableViewCell {
   
//    var todoTitle: UILabel = {
//        let todoTitle = UILabel()
//        todoTitle.textColor = .black
//        todoTitle.font = UIFont.boldSystemFont(ofSize: 16)
//        todoTitle.textAlignment = .left
//        return todoTitle
//    }()
//

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(todoTitle)
//        todoTitle.translatesAutoresizingMaskIntoConstraints = false
//        todoTitle.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
