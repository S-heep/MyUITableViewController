//
//  Person.swift
//  UITableViewTest
//
//  Created by 王娜 on 2018/4/7.
//  Copyright © 2018年 王娜. All rights reserved.
//

import UIKit
@objcMembers
class Person: NSObject {
    var name: String?
    var age: Int = 0

    init(dic: [String: Any]) {
        super.init()
        setValuesForKeys(dic)
    }

    deinit {
        // 负责对象销毁之前的内存释放工作，没有func ， 没有（），不允许重载荷带参数，在系统内部自动调用
    }

    convenience init?(name: String, age: Int) {
        self.init(dic: ["name": name, "age": age])
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("Undefinedkey:  \(key)--\(String(describing: value))")
    }
}
