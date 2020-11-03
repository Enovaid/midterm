//
//  NewAlarmVC.swift
//  midterm
//
//  Created by Айдана on 10/16/20.
//

import UIKit
protocol addAlarm {
    func addAlarm(alarm: Alarm)
}

class NewAlarmVC: UIViewController, UITextFieldDelegate {
    var alarm: Alarm?
    var addDelegate: addAlarm?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        timePicker.datePickerMode = UIDatePicker.Mode.time

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        //alarm?.time = df.string(from: datePicker.date)
        alarm = Alarm.init(df.string(from: timePicker.date), textField.text!)
        addDelegate?.addAlarm(alarm: alarm!)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
