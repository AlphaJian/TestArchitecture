//
//  Services.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import RxSwift

class Services {
    static func getStudents() -> [StudentModel] {
        return [StudentModel(name: "aa", age: 1),
                StudentModel(name: "bb", age: 2),
                StudentModel(name: "cc", age: 3),
                StudentModel(name: "dd", age: 4),
                StudentModel(name: "ee", age: 5),
                StudentModel(name: "ff", age: 6),
                StudentModel(name: "gg", age: 7),
                StudentModel(name: "hh", age: 8),
                StudentModel(name: "jj", age: 9),
                StudentModel(name: "kk", age: 10),
                StudentModel(name: "qq", age: 11),
                StudentModel(name: "ww", age: 12),
                StudentModel(name: "ee", age: 13),
                StudentModel(name: "rr", age: 14),
                StudentModel(name: "tt", age: 15),
                StudentModel(name: "yy", age: 16)]
    }

    static func getRXStudents() -> Observable<[StudentModel]> {
        return Observable<[StudentModel]>.just(getStudents())
    }
}
