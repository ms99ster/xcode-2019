//
//  ViewController.swift
//  S04-Date
//
//  Created by Li Wenya Colin on 2019/1/16.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myDate = Date();
        print(myDate);
        
        
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ";
        let myDateStr = formatter.string(from: myDate)
        print(myDateStr)
        
        let myDateStr2 = "2019-01-16 17:30:12+0800"
        let myDate2 = formatter.date(from: myDateStr2)!
        print(myDate2)
    }


}

