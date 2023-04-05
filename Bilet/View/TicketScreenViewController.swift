//
//  TicketScreenViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 5.04.2023.
//

import UIKit

class TicketScreenViewController: UIViewController {
    
    @IBOutlet weak var busImageView: UIImageView!
    @IBOutlet weak var startCityLabel: UILabel!
    @IBOutlet weak var lastCityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var seatNumberLabel: UILabel!
    @IBOutlet weak var ticketPriceLabel: UILabel!
    var ticket: Ticket?

    
    override func viewDidLoad() {
        super.viewDidLoad()

    //    print(ticket?.passenger.name)
    }


}
