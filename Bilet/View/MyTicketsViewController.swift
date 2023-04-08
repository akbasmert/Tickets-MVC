//
//  MyTicketsViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 7.04.2023.
//

import UIKit

class MyTicketsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
   

    

    var bus: Bus?
   // var startCity: String = ""
    var lastCity: String = "ls"
    var date: String = ""
    var ticketTotalPrice: String = "0"
    var ticketNumber: [Int] = []
    var ticket: Ticket?
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
  
}

extension MyTicketsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTicketCell", for: indexPath) as! MyTicketsTableViewCell
        
        return cell
    }
    
    
}
