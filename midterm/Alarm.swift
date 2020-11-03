//
//  Alarm.swift
//  midterm
//
//  Created by Айдана on 10/16/20.
//

import Foundation

class Alarm {
    var time: String?
    var notes: String?
    
    init(_ time: String, _ notes: String) {
        self.time = time
        self.notes = notes
    }
}
