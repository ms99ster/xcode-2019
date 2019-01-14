//
//  ViewController.swift
//  S02-showText
//
//  Created by Li Wenya Colin on 2019/1/14.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    
    
    @IBOutlet weak var textWKWeb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = URL(string: "https://raw.githubusercontent.com/ms99ster/learn/master/README.md")
        let myRequest = URLRequest(url: myURL!)
        textWKWeb.load(myRequest)
    }
    


}

