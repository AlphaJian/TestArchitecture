//
//  MVPViewController.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import UIKit

class MVPViewController: BaseViewController {

    var dataSource: [StudentModel] = [StudentModel]()

    var presenter: StudentPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        presenter = StudentPresenter(presenter: self)
        presenter.requestStudentList()
    }

    deinit {
        print("MVP deinit")
    }
}

extension MVPViewController: StudentPresenterProtocol {
    func reloadData(list: [StudentModel]) {
        dataSource = list
        tableview.reloadData()
    }
}

extension MVPViewController: UITableViewDelegate, UITableViewDataSource {
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
