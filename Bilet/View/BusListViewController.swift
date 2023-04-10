//
//  BusListViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 1.04.2023.
//

import UIKit

class BusListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var busCompany =  [Bus]()
    private var bus: Bus?
    var startCity: String = ""
    var lastCity: String = ""
    var date: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bus1 = Bus(imageName: "pamukkale", startTime: "00:30", price: "450 TL", seatStatus: "2+1", roadTime: "8s")
        let bus2 = Bus(imageName: "metro", startTime: "07:30", price: "400 TL", seatStatus: "2+1", roadTime: "7s")
        let bus3 = Bus(imageName: "kamil", startTime: "09:30", price: "350 TL", seatStatus: "2+1", roadTime: "8s")
        let bus4 = Bus(imageName: "pamukkale", startTime: "10:30", price: "450 TL", seatStatus: "2+1", roadTime: "7s 15dk")
        let bus5 = Bus(imageName: "metro", startTime: "11:30", price: "350 TL", seatStatus: "2+1", roadTime: "8")
        let bus6 = Bus(imageName: "ali", startTime: "12:30", price: "400 TL", seatStatus: "2+1", roadTime: "7s 30dk")
        let bus7 = Bus(imageName: "kamil", startTime: "13:30", price: "550 TL", seatStatus: "2+1", roadTime: "6s")
        let bus8 = Bus(imageName: "ali", startTime: "14:30", price: "600 TL", seatStatus: "2+1", roadTime: "7s")
        let bus9 = Bus(imageName: "kamil", startTime: "16:30", price: "450 TL", seatStatus: "2+1", roadTime: "9s")
        let bus10 = Bus(imageName: "pamukkale", startTime: "18:30", price: "650 TL", seatStatus: "2+1", roadTime: "6s 15dk")
        
        busCompany.append(bus1)
        busCompany.append(bus2)
        busCompany.append(bus3)
        busCompany.append(bus4)
        busCompany.append(bus5)
        busCompany.append(bus6)
        busCompany.append(bus7)
        busCompany.append(bus8)
        busCompany.append(bus9)
        busCompany.append(bus10)
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.red
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "\(startCity) > \(lastCity) (\(date))"
    }
}

extension BusListViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busCompany.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BusListTableViewCell
        bus = busCompany[indexPath.row]
        cell.configured(startCity: startCity, lastCity: lastCity, bus: bus!)
        cell.contentView.layer.cornerRadius = 50.0
        cell.contentView.layer.masksToBounds = true
           
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bus = busCompany[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationDetailVc = segue.destination as! DetailViewController
            destinationDetailVc.startCity = startCity
            destinationDetailVc.lastCity = lastCity
            destinationDetailVc.date = date
            destinationDetailVc.bus = bus
        }
    }
}
