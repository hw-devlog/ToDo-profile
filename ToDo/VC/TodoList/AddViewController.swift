//
//  AddViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class AddViewcontroller: UIViewController {

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
     
    }
}
extension AddViewcontroller {
    func addConfiguerUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .plain,
            target: self,
            action: #selector(saveButtonTapped)
        )
    }
    
    @objc func saveButtonTapped() {
        let alertController = UIAlertController(title: "섹션 선택", message: "할일을 어느 섹션에 추가하시겠습니까?", preferredStyle: .actionSheet)

        let workAction = UIAlertAction(title: "Work", style: .default) { (_) in
            self.saveTodoInSection("Work")
        }
        alertController.addAction(workAction)

        let lifeAction = UIAlertAction(title: "Life", style: .default) { (_) in
            self.saveTodoInSection("Life")
        }
        alertController.addAction(lifeAction)

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
    func saveTodoInSection(_ section: String) {
        guard let title = addTitle.text, let content = addContent.text else {
            return
        }

        // Core Data를 사용하여 Todo를 저장
        CoreDataManager.shared.createTask(title: title, content: content, isCompleted: false, section: section)

        navigationController?.popViewController(animated: true)
    }
}


