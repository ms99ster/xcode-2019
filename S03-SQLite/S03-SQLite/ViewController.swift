//
//  ViewController.swift
//  S03-SQLite
//
//  Created by Li Wenya Colin on 2019/1/15.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let s03SQLite = S03SQLite();
        s03SQLite.operate();
        s03SQLite.insert()
        let dataArray = s03SQLite.select();
        for dic in dataArray {
            print(dic)
        }
    }


}


