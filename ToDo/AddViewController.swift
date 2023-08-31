//
//  AddViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class addViewcontroller: UIViewController {
    
    lazy var textField: UITextField! = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(textField)
    }
    
}
