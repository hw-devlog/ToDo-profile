//
//  completeViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class DoneViewController: UIViewController {
    
    var headerList: [String] = ["Work", "Life"]
    
    private var doneTableView: UITableView = {
        let doneTableView = UITableView()
        doneTableView.translatesAutoresizingMaskIntoConstraints = false
        doneTableView.register(DoneTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        return doneTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DoneTableViewCell
        return cell
    }
    
    
}
