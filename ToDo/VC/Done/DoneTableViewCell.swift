//
//  DoneTableViewCell.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/19.
//

import UIKit

class DoneTableViewCell: UITableViewCell {
    var todo: Todo?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
