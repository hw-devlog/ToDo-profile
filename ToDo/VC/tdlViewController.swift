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
//    var list: [String] = ["1", "2", "3"]
    var headerList: [String] = ["works", "life"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        mainConfigureUI()
        navConfigureUI()
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
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 30)]
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
        return 2
    }
    //섹션별 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return list.count
        return 1
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! tdlTableCell
        cell.textLabel?.text = "Title"
        cell.detailTextLabel?.text = "subtitle"
//        cell.todoTitle.text = "Title"
        return cell
    }
    
    @objc func pushbtn3() {
        let addView = addViewcontroller()
        navigationController?.pushViewController(addView, animated: true)
        
    }
}
