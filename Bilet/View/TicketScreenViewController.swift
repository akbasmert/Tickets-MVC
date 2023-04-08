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
    var bus: Bus?
    var startCity: String = ""
    var lastCity: String = ""
    var ticketTotalPrice: String = ""
    var delegate: VeriGonderici?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        busImageView.image = UIImage(named: bus?.imageName ?? "kamil")
        startCityLabel.text = startCity
        lastCityLabel.text = lastCity
        dateLabel.text = "<\(ticket?.date.day ?? 1)/\(ticket?.date.month ?? 1)/\( ticket?.date.year ?? 2024) \( ticket?.time.hour ?? 00):\(ticket?.time.minute ?? 00)>"
        nameLabel.text = "Adınız: \(ticket?.passenger.name ?? "isimsiz") \(ticket?.passenger.surname ?? "isimsiz")"
        idLabel.text = "TCKN: \( ticket?.passenger.id ?? 0)"
        seatNumberLabel.text =  "Koltuk Seçiminiz: \(ticket?.seat.map { String($0) }.joined(separator: ", ") ?? "")"
        ticketPriceLabel.text = "Ödeme Tutarı: " + ticketTotalPrice
    }
    
   
    
    
    @IBAction func closeButton(_ sender: Any) {
        self.delegate?.veriGonder(veri: "veri gönderildi")
        navigationController?.popToRootViewController(animated: true)
        
    }
}
