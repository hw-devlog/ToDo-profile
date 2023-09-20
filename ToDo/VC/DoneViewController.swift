//
//  completeViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class DoneViewController: UIViewController {
    
    var headerList: [String] = ["Work", "Life"]
    var doneTodos: [Todo] = []
    
    private var doneTableView: UITableView = {
        let doneTableView = UITableView()
        doneTableView.translatesAutoresizingMaskIntoConstraints = false
        doneTableView.register(DoneTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        return doneTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneTodos = TodoManager.shared.doneTodos

        TodoManager.shared.moveCompletedTodosToDone()
        setup()
        mainConfigureUI()
    }

}
extension DoneViewController {
    
    func setup() {
        doneTableView.delegate = self
        doneTableView.dataSource = self
        view.addSubview(doneTableView)
    }
    func mainConfigureUI() {
        self.doneTableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            doneTableView.topAnchor.constraint(equalTo: view.topAnchor),
            doneTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            doneTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            doneTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
extension DoneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.shared.doneTodos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DoneTableViewCell
        
        let doneTodo = doneTodos[indexPath.row]
        cell.textLabel?.text = doneTodo.title // 셀에 todo의 제목을 표시
       return cell
    }
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TodoManager.shared.doneTodos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            TodoManager.shared.saveDoneTodos()
        }
    }
    
}
