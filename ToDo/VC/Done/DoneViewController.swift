//
//  completeViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class DoneViewController: UIViewController {
   
    private var doneTableView: UITableView = {
        let doneTableView = UITableView()
        doneTableView.translatesAutoresizingMaskIntoConstraints = false
        doneTableView.register(DoneTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        return doneTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneTableView.reloadData()
        setup()
        mainConfigureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        doneTableView.reloadData()
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
        // Core Data에서 완료된 작업을 가져옵니다.
        let completedTasks = CoreDataManager.shared.fetchAllTasks().filter { $0.iscompleted == true }
        return completedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Core Data에서 완료된 작업을 가져옵니다.
        let completedTasks = CoreDataManager.shared.fetchAllTasks().filter { $0.iscompleted == true }
        
        // 현재 인덱스 패스의 완료된 작업으로 셀을 구성합니다.
        let task = completedTasks[indexPath.row]
        cell.textLabel?.text = task.title // title이 Tasks 엔터티의 속성 이름이라고 가정합니다.
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Core Data에서 완료된 작업을 가져옵니다.
            var completedTasks = CoreDataManager.shared.fetchAllTasks().filter { $0.iscompleted == true }
            
            // 현재 인덱스 패스의 완료된 작업을 삭제합니다.
            if indexPath.row < completedTasks.count {
                let taskToDelete = completedTasks.remove(at: indexPath.row)
                CoreDataManager.shared.deleteTask(taskToDelete)
                
                // 테이블 뷰에서도 해당 행을 삭제합니다.
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
