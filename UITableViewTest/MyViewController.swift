//
//  MyViewController.swift
//  UITableViewTest
//
//  Created by 王娜 on 2018/4/7.
//  Copyright © 2018年 王娜. All rights reserved.
//

import UIKit

class MyViewController: UITableViewController {
    var persons = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initPersonArrays()
    }

    func initPersonArrays() {
        for i in 0...15 {
            let name = "李四\(i)"
            let age = arc4random() % 20 + 10
            var dict = [String: Any]()
            dict["name"] = name
            dict["age"] = age
            let person = Person.init(dic: dict)
            persons.append(person)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = persons[indexPath.row].name
        cell?.detailTextLabel?.text = "\(persons[indexPath.row].age)"
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailVcViewController()
        vc.person = persons[indexPath.row]
        vc.callBack = {
            tableView.reloadData()
        }
        //vc.callBack = tableView.reloadData
        navigationController?.pushViewController(vc, animated: true)
    }
}
