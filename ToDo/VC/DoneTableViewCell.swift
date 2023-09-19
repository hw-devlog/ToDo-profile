//
//  DoneTableViewCell.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/19.
//

import UIKit

class DoneTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
