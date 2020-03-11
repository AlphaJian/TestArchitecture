//
//  MVVM-RXViewController.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import RxSwift
import RxCocoa

class MVVM_RXViewController: BaseViewController {

    var viewModel: Student_RxViewModel!

    let viewDidLoadSignal = BehaviorSubject<Void>(value: ())

    var disposedBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewDidLoadSignal.onNext(())

        viewModel = Student_RxViewModel()
        bindUI()
    }

    func bindUI() {
        let input = Student_RxViewModel.Input(triggerGetStudents: viewDidLoadSignal)

        let output = viewModel.transform(input: input)
        output.updateStudents.asObservable().bind(to: tableview.rx.items) {(tableview, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = tableview.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "\(element.name) ---- \(element.age)"
            return cell
        }.disposed(by: disposedBag)
        
    }
}
