//
//  todolistViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class TodoTableViewController: UIViewController {
    
    var tasksInSection: [Tasks] = []
    
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
            todoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
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
         if section == 0 {
             return CoreDataManager.shared.fetchTasksInSection("Work").count
         } else if section == 1 {
             return CoreDataManager.shared.fetchTasksInSection("Life").count
         }
         return 0
     }
    
    //섹션별 타이틀
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerList[section]
    }
    //헤더뷰 속성
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         guard let header = view as? UITableViewHeaderFooterView else { return }
        header.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 20)
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.sizeToFit()
     }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
         
         let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20))
         footerView.backgroundColor = .systemBackground
         let lineView = UIView()
         footerView.addSubview(lineView)
         
         lineView.translatesAutoresizingMaskIntoConstraints = false
         lineView.backgroundColor = .lightGray
         lineView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 20).isActive = true
         lineView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -20).isActive = true
         lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
         lineView.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 0).isActive = true

         return footerView
     }
    //셀에 표시될 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! tdlTableCell
        let section = indexPath.section
        let row = indexPath.row

        var tasksInSection: [Tasks] = []

        if section == 0 {
            tasksInSection = CoreDataManager.shared.fetchTasksInSection("Work")
        } else {
            tasksInSection = CoreDataManager.shared.fetchTasksInSection("Life")
        }

        let task = tasksInSection[row]

        cell.textLabel?.text = task.title // 셀에 작업 제목 표시
        cell.task = task // 셀에 작업 객체 설정

        return cell
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "done") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }

            // 해당 셀을 완료 처리
            if indexPath.section == 0 {
                // 첫 번째 섹션 (work)에서 완료 처리
                if indexPath.row < CoreDataManager.shared.fetchTasksInSection("Work").count {
                    let task = CoreDataManager.shared.fetchTasksInSection("Work")[indexPath.row]
                    task.iscompleted = true // done 상태를 true로 변경
                    CoreDataManager.shared.saveContext() // 변경사항 저장
                }
            } else if indexPath.section == 1 {
                // 두 번째 섹션 (life)에서 완료 처리
                if indexPath.row < CoreDataManager.shared.fetchTasksInSection("Life").count {
                    let task = CoreDataManager.shared.fetchTasksInSection("Life")[indexPath.row]
                    task.iscompleted = true // done 상태를 true로 변경
                    CoreDataManager.shared.saveContext() // 변경사항 저장

                }
            }
            todoTableView.reloadData()
            // completionHandler 호출
            completionHandler(true)
        }

        let configuration = UISwipeActionsConfiguration(actions: [completeAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let section = indexPath.section
            let row = indexPath.row

            if section == 0 {
                // 첫 번째 섹션 (Work)에서 삭제
                let tasksInSection = CoreDataManager.shared.fetchTasksInSection("Work")
                if row < tasksInSection.count {
                    let taskToDelete = tasksInSection[row]
                    CoreDataManager.shared.deleteTask(taskToDelete)
                    todoTableView.deleteRows(at: [indexPath], with: .fade)
                }
            } else if section == 1 {
                // 두 번째 섹션 (Life)에서 삭제
                let tasksInSection = CoreDataManager.shared.fetchTasksInSection("Life")
                if row < tasksInSection.count {
                    let taskToDelete = tasksInSection[row]
                    CoreDataManager.shared.deleteTask(taskToDelete)
                    todoTableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
    
    @objc func pushbtn3() {
        let addView = AddViewcontroller()
        navigationController?.pushViewController(addView, animated: true)
    }
}
