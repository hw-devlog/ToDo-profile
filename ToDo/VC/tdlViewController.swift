//
//  todolistViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class TodoTableViewController: UIViewController {
    
    var todo: Todo?
    var worktodoList: [Todo] = [] // 작업 목록
    var lifetodoList: [Todo] = []
    
    var todoTableView: UITableView = {
        let todoTableView = UITableView()
        todoTableView.translatesAutoresizingMaskIntoConstraints = false
        todoTableView.register(tdlTableCell.classForCoder(), forCellReuseIdentifier: "Cell")
        return todoTableView
    }()

    var headerList: [String] = ["Work", "Life"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        TodoManager.shared.loadLifeTodo()
        TodoManager.shared.loadWorkTodo()
        
        setup()
        mainConfigureUI()
        navConfigureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todoTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        TodoManager.shared.saveLifeTodo()
        TodoManager.shared.saveWorkTodo()
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
            return TodoManager.shared.worktodoList.count
             }
             else if section == 1 {
                 return TodoManager.shared.lifetodoList.count
             }
             return 0
             //return headerList[section].count
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
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.adjustsFontSizeToFitWidth = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! tdlTableCell// Access the appropriate data source based on the section
        let section = indexPath.section
          let row = indexPath.row
    
          var todo: Todo
          if section == 0 {
              todo = TodoManager.shared.worktodoList[row]
          } else {
              todo = TodoManager.shared.lifetodoList[row]
          }
          cell.textLabel?.text = todo.title // 셀에 todo의 제목을 표시
          cell.todo = todo // todo 객체를 셀에 설정

         return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "done") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }

            // 해당 셀을 완료 처리
            if indexPath.section == 0 {
                // 첫 번째 섹션 (work)에서 완료 처리
                if indexPath.row < TodoManager.shared.worktodoList.count {
                    TodoManager.shared.worktodoList[indexPath.row].done = true
                    // 해당 작업을 doneTodos에 추가
                    let completedTodo = TodoManager.shared.worktodoList.remove(at: indexPath.row)
                    TodoManager.shared.doneTodos.append(completedTodo)
                    // 해당 작업을 worktodoList에서 제거
                    TodoManager.shared.removeTodoFromWorkList(at: indexPath.row)
                }
            } else if indexPath.section == 1 {
                // 두 번째 섹션 (life)에서 완료 처리
                if indexPath.row < TodoManager.shared.lifetodoList.count {
                    TodoManager.shared.lifetodoList[indexPath.row].done = true
                    // 해당 작업을 doneTodos에 추가
                    let completedTodo = TodoManager.shared.lifetodoList.remove(at: indexPath.row)
                    TodoManager.shared.doneTodos.append(completedTodo)
                    // 해당 작업을 lifetodoList에서 제거
                    TodoManager.shared.removeTodoFromLifeList(at: indexPath.row)
                }
            }

            // 완료된 항목을 doneTodos로 이동
            TodoManager.shared.moveCompletedTodosToDone()

            // 테이블 뷰에서 해당 셀 삭제
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            // completionHandler 호출
            completionHandler(true)
        }

        let configuration = UISwipeActionsConfiguration(actions: [completeAction])
        return configuration
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
