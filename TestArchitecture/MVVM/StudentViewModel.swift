//
//  StudentViewModel.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import UIKit

class StudentViewModel: NSObject {

    var datasource: [StudentModel] = [StudentModel]()

    // output
    var updateStudents: (([StudentModel]) -> Void)?

    //  input
    func triggerGetStudents() {
        datasource = Services.getStudents()
    }
}
