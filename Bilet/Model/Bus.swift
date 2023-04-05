//
//  Bus.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 3.04.2023.
//

import Foundation

class Bus {
    
    var imageName: String?
    var startTime: String?
    var price: String?
    var seatStatus: String?
    var roadTime: String?
    
    init(imageName: String? = nil, startTime: String? = nil, price: String? = nil, seatStatus: String? = nil, roadTime: String? = nil) {
        self.imageName = imageName
        self.startTime = startTime
        self.price = price
        self.seatStatus = seatStatus
        self.roadTime = roadTime
    }
}
