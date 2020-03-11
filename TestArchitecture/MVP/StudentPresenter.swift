//
//  StudentPresenter.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import UIKit

protocol StudentPresenterProtocol: class {
    func reloadData(list: [StudentModel])
}

class StudentPresenter {
    weak var presenter: StudentPresenterProtocol!

    init(presenter: StudentPresenterProtocol) {
        self.presenter = presenter
    }

    func requestStudentList() {
        let data = Services.getStudents()
        presenter.reloadData(list: data)
    }

}
