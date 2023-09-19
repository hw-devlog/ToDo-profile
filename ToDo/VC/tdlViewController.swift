//
//  todolistViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class TodoTableViewController: UIViewController {

    var todoTableView: UITableView = {
        let todoTableView = UITableView()
        todoTableView.translatesAutoresizingMaskIntoConstraints = false
        todoTableView.register(tdlTableCell.classForCoder(), forCellReuseIdentifier: "Cell")
        return todoTableView
    }()
    
    var headerList: [String] = ["Work", "Life"]
 
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        mainConfigureUI()
        navConfigureUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        TodoManager.shared.loadLifeTodo()
        TodoManager.shared.loadWorkTodo()
        todoTableView.reloadData()
    }
}
 

extension TodoTableViewController {
    
    func setup() {
        todoTableView.delegate = self
        todoTableView.dataSource = self
        view.addSubview(todoTableView)
    }
    func mainConfigureUI() {
        self.todoTableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            todoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            todoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            todoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            todoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    func navConfigureUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 22)]
        navigationItem.title = "todolist"
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: #selector(pushbtn3))
        }
}

extension TodoTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    //섹션의 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerList.count
    }
    //섹션별 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return list.count
        if section == 0 {
            return TodoManager.shared.worktodoList.count
             }
             else if section == 1{
                 return TodoManager.shared.lifetodoList.count
             }
             
             return headerList[section].count
    }
    //섹션별 타이틀
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerList[section]
    }
    //헤더뷰 속성
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         guard let header = view as? UITableViewHeaderFooterView else { return }
        header.translatesAutoresizingMaskIntoConstraints = false
        header.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.adjustsFontSizeToFitWidth = true
     }
    //셀에 표시될 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! tdlTableCell// Access the appropriate data source based on the section
        
        let section = headerList[indexPath.section]
        
        if section == "Work" {
             let workTodos = TodoManager.shared.worktodoList
             if indexPath.row < workTodos.count {
                 cell.textLabel?.text = workTodos[indexPath.row].title
             } else {
                 cell.textLabel?.text = "No data found"
             }
         } else {
             let lifeTodos = TodoManager.shared.lifetodoList
             if indexPath.row < lifeTodos.count {
                 cell.textLabel?.text = lifeTodos[indexPath.row].title
             } else {
                 cell.textLabel?.text = "No data found"
             }
         }
         
         return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               if indexPath.section == 0 {
                   TodoManager.shared.worktodoList.remove(at: indexPath.row)
                   tableView.deleteRows(at: [indexPath], with: .fade)
                   TodoManager.shared.saveWorkTodo()
               } else if indexPath.section == 1 {
                   TodoManager.shared.lifetodoList.remove(at: indexPath.row)
                   tableView.deleteRows(at: [indexPath], with: .fade)
                   TodoManager.shared.saveLifeTodo()
               }
           }
       }
    
    @objc func pushbtn3() {
        let addView = AddViewcontroller()
        navigationController?.pushViewController(addView, animated: true)
        
    }
}
