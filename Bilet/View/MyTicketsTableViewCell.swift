//
//  MyTicketsTableViewCell.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 8.04.2023.
//

import UIKit

class MyTicketsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var startCityLabel: UILabel!
    @IBOutlet weak var lastCityLabel: UILabel!
    @IBOutlet weak var busImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configured(priceLabel: String, startLabel: String, lastCityLabel: String, bus: Bus, ticket: Ticket) {
          
        self.nameLabel.text = "\(ticket.passenger.name) \(ticket.passenger.surname)"
        self.dateLabel.text = "\(ticket.date.day)/\(ticket.date.month)/\(ticket.date.year) \(ticket.time.hour):\(ticket.time.minute)"
        self.seatsLabel.text =  "Koltuk No: \(ticket.seat.map { String($0) }.joined(separator: ", "))"
        self.priceLabel.text = priceLabel
        self.startCityLabel.text = startLabel
        self.lastCityLabel.text = lastCityLabel
        self.busImageView.image = UIImage(named: bus.imageName ?? "ali")
          
      }
}
