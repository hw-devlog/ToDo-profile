//
//  todolistTableViewCell.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class tdlTableCell: UITableViewCell {
 
    var todo: Todo?
    
//    var doneCheckButton: UIButton! = {
//        let doneCheckButton = UIButton()
//        doneCheckButton.translatesAutoresizingMaskIntoConstraints = false
//        doneCheckButton.isEnabled = true
//        doneCheckButton.setImage(UIImage(named: "checkmark.square")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal) // 체크 안 된 상태 이미지
//        doneCheckButton.setImage(UIImage(named: "checkmark.square.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .selected) // 체크된 상태 이미지
//        return doneCheckButton
//    }()
//
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle , reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(doneCheckButton)
        
        // 체크 박스 버튼의 오토레이아웃을 설정합니다.
//        NSLayoutConstraint.activate([
//          doneCheckButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//          doneCheckButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//        ])
//
                
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


