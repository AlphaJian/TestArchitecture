//
//  StudentRxViewModel.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

class Student_RxViewModel: ViewModelType {
    struct Input {
        let triggerGetStudents: Observable<Void>
    }

    struct Output {
        let updateStudents: Observable<[StudentModel]>
    }

    var datasource = BehaviorRelay<[StudentModel]>(value: [])

    var disposedBag = DisposeBag()

    func transform(input: Input) -> Output {
        input.triggerGetStudents.flatMap { (_) -> Observable<[StudentModel]> in
            return Services.getRXStudents()
        }.subscribe(onNext: { [weak self] (list) in
            self?.datasource.accept(list)
        }).disposed(by: disposedBag)

        return Output(updateStudents: datasource.asObservable())
    }
}
