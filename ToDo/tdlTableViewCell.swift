//
//  todolistTableViewCell.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class tdlTableCell: UITableViewCell {
    public var lbl: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
        contentView.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        lbl.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        
    }
    private func setup() {
        lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
    }
}
