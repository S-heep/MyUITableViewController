//
//  DetailVcViewController.swift
//  UITableViewTest
//
//  Created by 王娜 on 2018/4/7.
//  Copyright © 2018年 王娜. All rights reserved.
//

import UIKit

class DetailVcViewController: UIViewController {

    var person: Person!
    var lable1: UITextField!
    var lable2: UITextField!
    var callBack: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        initLables()
        initButton()
        view.backgroundColor = UIColor.white
        lable1.text = person.name
        lable2.text = "\(person.age)"
    }

    func initLables() {
        lable1 = UITextField.init(frame: CGRect(x: 20, y: 100, width: 200, height: 50))
        lable1.placeholder = "请输入1"

        lable2 = UITextField.init(frame: CGRect(x: 20, y: 200, width: 200, height: 50))
        lable2.placeholder = "请输入2"
        lable1.borderStyle = .bezel
        lable2.borderStyle = .bezel
        view.addSubview(lable1)
        view.addSubview(lable2)
    }

    func initButton() {
        let button = UIButton.init(type: .custom)
        button.frame = CGRect(x: 20, y: 300, width: 200, height: 50)
        button.setTitle("click", for: .normal)
        button.tintColor = UIColor.red
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func back() {
        person.name = lable1.text
        person.age = Int(lable2.text!) ?? 0
        callBack?()
        navigationController?.popViewController(animated: true)
    }

}
