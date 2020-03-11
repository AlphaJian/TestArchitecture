//
//  MVCViewController.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import UIKit

class MVCViewController: BaseViewController {

    var dataSource: [StudentModel] = [StudentModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self

        requestStudents { [weak self] (students) in
            self?.dataSource = students
            self?.tableview.reloadData()
        }
    }

    func requestStudents(handler: ([StudentModel]) -> Void) {
        handler(Services.getStudents())
    }

    deinit {
        print("MVC deinit")
    }
}

extension MVCViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let model = dataSource[indexPath.row]
        cell.textLabel?.text = "\(model.name) ---- \(model.age)"
        return cell
    }
}
