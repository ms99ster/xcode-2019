//
//  ViewController.swift
//  Content_Views-UIDatePicker
//
//  Created by Li Wenya Colin on 2019/2/21.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInputView: UITextField!
    
    @IBAction func textFocused(_ sender: UITextField) {
    }
    
    lazy var uiDatePicker : UIDatePicker = getDatePickerView();
    
    lazy var uiToolBar : UIToolbar = getToolBar ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textInputView.text = formatDate(date: Date())
        textInputView.inputView = uiDatePicker
        textInputView.inputAccessoryView = uiToolBar
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getDatePickerView() -> UIDatePicker{
        uiDatePicker = UIDatePicker()
        uiDatePicker.datePickerMode = .date
        uiDatePicker.locale = Locale.init(identifier: "zh-Hans")
        return uiDatePicker;
    }
    
    func getToolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.bounds = CGRect(x: 0, y: 0, width: 0, height: 44)
        
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelSelected as () -> ()))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let okBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(okSelected as () -> ()))
        toolBar.items = [cancelBtn, spaceItem, okBtn]
        
        return toolBar
    }
    
    @objc func cancelSelected(){
        textInputView.endEditing(true)
        print("cancel btn clicked")
    }
    
    @objc func okSelected(){
        print("done btn clicked")
        let date = uiDatePicker.date
        let calendar = uiDatePicker.calendar
        print(date)
        
       
        textInputView.text = formatDate(date: date)
        textInputView.endEditing(true)
    }
    func formatDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }

}

