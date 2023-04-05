//
//  Time.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 1.04.2023.
//

import Foundation

class Time {
    
    var hour: Int = 0
    var minute: Int = 0
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
    
    func printTime() {
        print("\(hour): \(minute)")
    }
}
