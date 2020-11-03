//
//  EditAlarmVC.swift
//  midterm
//
//  Created by Айдана on 10/16/20.
//

import UIKit
protocol deleteAlarm {
    func deleteAlarmbBy(index i: Int)
}
protocol changeAlarm {
    func changeAlarmBy(index i: Int, _ alarm: Alarm)
}


class EditAlarmVC: UIViewController, UITextFieldDelegate {
    var deleteDelegate: deleteAlarm?
    var changeDelegate: changeAlarm?
    var currentIndex: Int?
    var alarm: Alarm?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.text = alarm?.notes
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let date = dateFormatter.date(from: (alarm?.time)!)
        timePicker.datePickerMode = UIDatePicker.Mode.time
        timePicker.date = date!
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        deleteDelegate?.deleteAlarmbBy(index: currentIndex!)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeButton(_ sender: UIButton) {
        alarm?.notes = textField.text
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        alarm?.time = df.string(from: timePicker.date)
        changeDelegate?.changeAlarmBy(index: currentIndex!, alarm!)
        navigationController?.popViewController(animated: true)
    }
    

}
