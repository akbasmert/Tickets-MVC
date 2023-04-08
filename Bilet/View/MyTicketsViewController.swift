//
//  MyTicketsViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 7.04.2023.
//

import UIKit

class MyTicketsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var ticket: Ticket?
    var bus: Bus?
    var startCity: String = ""
    var lastCity: String = ""
    var ticketTotalPrice: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bus = TicketScreenViewController.myTicketScreenBus
        ticket = TicketScreenViewController.myTicketScreenTicket
        startCity = TicketScreenViewController.myTicketScreenStartCity
        lastCity = TicketScreenViewController.myTicketScreenLastCity
        ticketTotalPrice = TicketScreenViewController.myTicketScreenTicketTotalPrice
        tableView.reloadData()
    }
    
    
  
}

extension MyTicketsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        if startCity == "" {
            
            let backgroundImageView = UIImageView(image: UIImage(named: "ticketnew"))
            backgroundImageView.contentMode = .scaleAspectFit

            tableView.backgroundView = backgroundImageView

            return 0
        } else {
           tableView.backgroundView = nil
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTicketCell", for: indexPath) as! MyTicketsTableViewCell
        cell.configured(priceLabel: ticketTotalPrice, startLabel: startCity, lastCityLabel: lastCity, bus: bus!, ticket: ticket!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
