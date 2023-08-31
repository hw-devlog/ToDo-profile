//
//  todolistViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class tdlViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tdlTableView: UITableView!
    var list: [String] = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        tdlTableView = UITableView()
        tdlTableView.delegate = self
        tdlTableView.dataSource = self
        view.addSubview(tdlTableView)
        tdlTableView.register(tdlTableCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        //레이아웃
        tdlTableView.translatesAutoresizingMaskIntoConstraints = false
        
        tdlTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tdlTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tdlTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tdlTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! tdlTableCell
        
        cell.lbl.text = list[indexPath.row]
        return cell
    }
    
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "todolist"
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: nil,
            action: #selector(pushbtn3))
        }
    
    @objc func pushbtn3() {
        let addView = addViewcontroller()
        navigationController?.pushViewController(addView, animated: true)
        
    }
}
