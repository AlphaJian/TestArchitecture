//
//  BaseViewController.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    lazy var tableview: UITableView = {
        let tb = UITableView(frame: CGRect.zero, style: .plain)
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(64)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
