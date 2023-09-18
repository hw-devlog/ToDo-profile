//
//  AddViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class AddViewcontroller: UIViewController {
    
    var todoList: [Todo] = []
    
     var addTitle: UITextField! = {
        let addTitle = UITextField()
        addTitle.translatesAutoresizingMaskIntoConstraints = false
        addTitle.textAlignment = .natural
        addTitle.font = UIFont.systemFont(ofSize: 16)
        addTitle.layer.borderWidth = 1.0
        addTitle.layer.borderColor = UIColor.black.cgColor
         addTitle.placeholder = "제목을 입력하세요"
        return addTitle
    }()
     var addContent: UITextView! = {
        let addContent = UITextView()
        addContent.translatesAutoresizingMaskIntoConstraints = false
        addContent.textAlignment = .natural
        addContent.font = UIFont.systemFont(ofSize: 16)
        addContent.layer.borderWidth = 1.0
        addContent.layer.borderColor = UIColor.black.cgColor
        return addContent
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    
        self.view.addSubview(addTitle)
        self.view.addSubview(addContent)
        addConfiguerUI()
        
        //레이아웃
        addTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        addTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addTitle.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        
        addContent.topAnchor.constraint(equalTo: addTitle.bottomAnchor,constant: 10).isActive = true
        addContent.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addContent.heightAnchor.constraint(equalToConstant: 500).isActive = true
        addContent.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        //  textField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        // textField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        //텍스트뷰 크기 지정
    }
}
extension AddViewcontroller {
    func addConfiguerUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
        title:"Done",
        style: .plain,
        target: self,
        action: #selector(buttonpressed)
        )
    }
    @objc func buttonpressed() {
        let item: Todo = Todo(title: self.addTitle.text ?? "", content: self.addContent.text ?? "", done: false)
        UserManager.shared.worktodoList.append(item)
        self.navigationController?.popViewController(animated: true)
    }
}
//
//TodoManager.shared.addTodo(title: "새 할 일", content: "", category: "일반", isCompleted: false)
//tableView.reloadData()
