//
//  ViewController.swift
//  midterm
//
//  Created by Айдана on 10/16/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, deleteAlarm, changeAlarm, addAlarm {
    func addAlarm(alarm: Alarm) {
        alarms.append(alarm)
        myTableView.reloadData()
    }
    
    func deleteAlarmbBy(index i: Int) {
        alarms.remove(at: i)
        myTableView.reloadData()
    }
    
    func changeAlarmBy(index i: Int, _ alarm: Alarm) {
        alarms[i] = alarm
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? customCell
        cell?.timeLabel.text = alarms[indexPath.row].time
        cell?.notesLabel.text = alarms[indexPath.row].notes
        return cell!
    }
    
    var alarms = [
        Alarm.init("10:00", "breakfast"),
        Alarm.init("18:00", "serial")
    ]
    

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            alarms.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditAlarmSegue"{
            let index = (myTableView.indexPathForSelectedRow?.row)!
            let destination = segue.destination as! EditAlarmVC
            destination.alarm = alarms[index]
            destination.currentIndex = index
            destination.deleteDelegate = self
            destination.changeDelegate = self
        }
        else  if segue.identifier == "NewAlarmSegue" {
            let destination = segue.destination as! NewAlarmVC
            destination.addDelegate = self
        }
        
    }


}

