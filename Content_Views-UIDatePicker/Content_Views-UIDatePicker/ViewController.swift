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
    
    @IBOutlet weak var textInputView2: UITextField!
    
    @IBOutlet weak var textInputView3: UITextField!
    
    @IBOutlet weak var textInputView4: UITextField!
    
    weak var editingText: UITextField?
    

    @IBAction func textFocused(_ sender: UITextField) {
        print(sender.restorationIdentifier)
        switch sender.restorationIdentifier {
        case "text1":
            editingText = textInputView
            uiDatePicker.datePickerMode = .date
        case "text2":
            editingText = textInputView2
            uiDatePicker.datePickerMode = .time
        case "text3":
            editingText = textInputView3
            uiDatePicker.datePickerMode = .dateAndTime
        case "text4":
            editingText = textInputView4
            uiDatePicker.datePickerMode = .countDownTimer
        default:
            print("never shold run")
        }
    }
    
    lazy var uiDatePicker : UIDatePicker = getDatePickerView();
    
    lazy var uiToolBar : UIToolbar = getToolBar ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textEditorDictionary: [String: Any] = [
            "text1":(uiTextField: textInputView, datepickerMode: UIDatePicker.Mode.date, dateformat: "yyyy-MM-dd"),
            "text2":(uiTextField: textInputView2, datepickerMode: UIDatePicker.Mode.date, dateformat: "HH:mm:ss"),
            "text3":(uiTextField: textInputView3, datepickerMode: UIDatePicker.Mode.date, dateformat: "yyyy-MM-dd HH:mm:ss"),
            "text4":(uiTextField: textInputView4, datepickerMode: UIDatePicker.Mode.date, dateformat: "mm:ss")
        ]
        
        for inputView in textEditorDictionary {
            let textEditor = inputView.value as! (uiTextField: UITextField?, datepickerMode: UIDatePicker.Mode, dateformat: String)
            
            bindInputView(inputView: textEditor.uiTextField, dateFormat: textEditor.dateformat)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func bindInputView(inputView: UITextField!, dateFormat: String){
        inputView.text = formatDate(date: Date(), dateFormat:  dateFormat)
        inputView.inputView = uiDatePicker
        inputView.inputAccessoryView = uiToolBar
    }
    func getDatePickerView() -> UIDatePicker{
        uiDatePicker = UIDatePicker()
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
        editingText!.endEditing(true)
        print("cancel btn clicked")
    }
    
    @objc func okSelected(){
        print("done btn clicked")
        let date = uiDatePicker.date
        print(date)
        
        editingText!.text = formatDate(date: date, dateFormat: "yyyy-MM-dd HH:mm:ss")
        editingText!.endEditing(true)
    }
    func formatDate(date: Date, dateFormat: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }

}

