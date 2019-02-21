//
//  ViewController.swift
//  Content_Views-UIImageView
//
//  Created by Li Wenya Colin on 2019/2/21.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var uiImageView1: UIImageView!
    @IBOutlet weak var uiImageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiImageView2.image = UIImage(named: "cn")
        
        
        var nationImages: [UIImage]=[];
        for item in ["tw","cn"] {
            nationImages.append(UIImage(named: item)!)
        }
        print(nationImages)
        
        uiImageView1.animationImages = nationImages
        uiImageView1.animationDuration = 1
        uiImageView1.startAnimating()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

