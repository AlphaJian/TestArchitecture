//
//  MVVMViewController.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import UIKit

class MVVMViewController: BaseViewController {

    var viewModel: StudentViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self

        viewModel = StudentViewModel()
        bindUI()
        viewModel.triggerGetStudents()
    }

    func bindUI() {
        viewModel.updateStudents = { [weak self] (list) in
            self?.tableview.reloadData()
        }
    }

    deinit {
        print("MVVM deinit")
    }
}

extension MVVMViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let model = viewModel.datasource[indexPath.row]
        cell.textLabel?.text = "\(model.name) ---- \(model.age)"
        return cell
    }
}
