//
//  Ticket.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 1.04.2023.
//

import Foundation

class Ticket {
    var passenger: Passenger
    var date: Date
    var time: Time
    var seat: [Int]?
    var numberOfSeats: Int = 0
    
    init(passenger: Passenger, date: Date, time: Time, seat: [Int], numberOfSeats: Int) {
        self.passenger = passenger
        self.date = date
        self.time = time
        self.seat = seat
        self.numberOfSeats = numberOfSeats
    }
    
    func printTicket() {
        print("\(passenger.name) \(passenger.surname) \(passenger.id) , \(date.day)/\(date.month)/\(date.year) , \(time.hour):\(time.minute) | \(seat)")
    }
    
    func addSeat(seatno: Int) {
        var arraySeats = [Int]()
        arraySeats.append(seatno)
    }
}
