//
//  ViewController.swift
//  TestArchitecture
//
//  Created by ken.zhang on 2020/3/11.
//  Copyright © 2020 ken.zhang. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    lazy var mvcBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("MVC", for: .normal)

        return btn
    }()

    lazy var mvpBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("MVP", for: .normal)

        return btn
    }()

    lazy var mvvmBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("MVVM", for: .normal)

        return btn
    }()

    lazy var mvvmrxBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("MVVM-RX", for: .normal)

        return btn
    }()

    var disposedBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(mvcBtn)
        mvcBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }

        view.addSubview(mvpBtn)
        mvpBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }

        view.addSubview(mvvmBtn)
        mvvmBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }

        view.addSubview(mvvmrxBtn)
        mvvmrxBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(250)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }

        mvcBtn.rx.tap.subscribe(onNext: { [unowned self] (_) in
            self.navigationController?.pushViewController(MVCViewController(), animated: true)
        }).disposed(by: disposedBag)

        mvpBtn.rx.tap.subscribe(onNext: {  [unowned self] (_) in
            self.navigationController?.pushViewController(MVPViewController(), animated: true)
        }).disposed(by: disposedBag)

        mvvmBtn.rx.tap.subscribe(onNext: {  [unowned self] (_) in
            self.navigationController?.pushViewController(MVVMViewController(), animated: true)
        }).disposed(by: disposedBag)

        mvvmrxBtn.rx.tap.subscribe(onNext: {  [unowned self] (_) in
            self.navigationController?.pushViewController(MVVM_RXViewController(), animated: true)
        }).disposed(by: disposedBag)
    }


}

