//
//  TicketScreenViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 5.04.2023.
//

import UIKit

class TicketScreenViewController: UIViewController {
    
    var ticket: Ticket?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(ticket?.passenger.name)
    }

}
