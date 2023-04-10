//
//  Date.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 1.04.2023.
//

import Foundation

class Date {
    
    var day: Int = 1
    var month: Int = 1
    var year: Int = 2024
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func printDate() {
        print("\(day) / \(month) / \(year)")
    }
}
