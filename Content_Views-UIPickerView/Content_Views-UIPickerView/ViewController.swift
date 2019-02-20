//
//  ViewController.swift
//  Content_Views-UIPickerView
//
//  Created by Li Wenya Colin on 2019/2/20.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBAction func randomClicked(_ sender: Any) {
        for index in 0 ..< datas.count{
            let row = Int.random(in: 0 ..< datas[index].count)
            uiPickerView.selectRow(row, inComponent: index, animated: true)
            pickerView(uiPickerView, didSelectRow: row, inComponent: index)
        }
        
    }
    @IBOutlet weak var uiPickerView: UIPickerView!
    
    @IBOutlet weak var component1Lbl: UILabel!
    @IBOutlet weak var component2Lbl: UILabel!
    @IBOutlet weak var component3Lbl: UILabel!
    
    var datas = [
        ["1-1", "1-2", "1-3", "1-4","1-5", "1-6","1-7", "1-8"],
        ["2-1", "2-2", "2-3", "2-4","2-5", "2-6","2-7", "2-8"],
        ["3-1", "3-2", "3-3", "3-4","3-5", "3-6","3-7", "3-8"]
    ]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return datas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datas[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datas[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            component1Lbl.text = datas[component][row]
        case 1:
            component2Lbl.text = datas[component][row]
        case 2:
            component3Lbl.text = datas[component][row]
        default:
            print("should never run")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for index in 0 ..< datas.count{
            let row = Int.random(in: 0 ..< datas[index].count)
            print(row)
        }
        
        for index in 0 ..< datas.count {
            let row = uiPickerView.selectedRow(inComponent: index)
            pickerView(uiPickerView, didSelectRow: row, inComponent: index)
        }
    }


}

