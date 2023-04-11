//
//  BustListTableViewCell.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 1.04.2023.
//

import UIKit

class BusListTableViewCell: UITableViewCell {

    @IBOutlet weak var lastCityLabel: UILabel!
    @IBOutlet weak var startCityLabel: UILabel!
    @IBOutlet weak var busStartTime: UILabel!
    @IBOutlet weak var busPrice: UILabel!
    @IBOutlet weak var busRoadTime: UILabel!
    @IBOutlet weak var busSeatStatus: UILabel!
    @IBOutlet weak var busImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configured(startCity: String, lastCity: String, bus: Bus) {
        startCityLabel.text = startCity
        lastCityLabel.text = lastCity
        busPrice.text = bus.price
        busRoadTime.text = bus.roadTime
        busImageView.image = UIImage(named: bus.imageName ?? "star")
        busStartTime.text = bus.startTime
        busSeatStatus.text = bus.seatStatus
    }
}
