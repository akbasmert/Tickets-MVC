//
//  PaymentViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 5.04.2023.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var busİmageViev: UIImageView!
    @IBOutlet weak var passengerNameTF: UITextField!
    @IBOutlet weak var passengerSurNameTF: UITextField!
    @IBOutlet weak var passengerIdTF: UITextField!
    @IBOutlet weak var paymentPriceLabel: UILabel!
    @IBOutlet weak var seatNumbersLabel: UILabel!
    @IBOutlet weak var paymentButton: UIButton!
    
    var bus: Bus?
    var startCity: String = ""
    var lastCity: String = ""
    var date: String = ""
    var ticketTotalPrice: String = "0"
    var ticketNumber: [Int] = []
    var ticket: Ticket?

    override func viewDidLoad() {
        super.viewDidLoad()

        busİmageViev.image = UIImage(named: bus?.imageName ?? "pamukkale")
        paymentPriceLabel.text = "Ödeme Tutarı: " + ticketTotalPrice
        seatNumbersLabel.text = "Koltuk Seçiminiz: \(ticketNumber.map { String($0) }.joined(separator: ", "))"
        self.title = "BİLETİM.COM"
    }
    
    @IBAction func paymentButton(_ sender: Any) {
  
        if let id = passengerIdTF.text, let name = passengerNameTF.text, let surName = passengerSurNameTF.text {

            let dateComponents = date.components(separatedBy: "-")
            let day = Int(dateComponents[0]) ?? 1
            let month = Int(dateComponents[1]) ?? 1
            let year = Int(dateComponents[2]) ?? 2024
            
            let timeComponents = bus?.startTime?.components(separatedBy: ":")
            let hour = Int(timeComponents?[0] ?? "0")!
            let minute = Int(timeComponents?[1] ?? "0")!


            ticket = Ticket(passenger: Passenger(id: Int(id) ?? 0, name: name, surname: surName), date: Date(day: day, month: month, year: year), time: Time(hour: hour, minute: minute), seat: ticketNumber, numberOfSeats: ticketNumber.count)
            
            performSegue(withIdentifier: "toTicketScreen", sender: nil)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTicketScreen" {
            let destinatiınTicketScreen = segue.destination as! TicketScreenViewController
            destinatiınTicketScreen.ticket = ticket
            destinatiınTicketScreen.bus = bus
            destinatiınTicketScreen.startCity = startCity
            destinatiınTicketScreen.lastCity = lastCity
            destinatiınTicketScreen.ticketTotalPrice = ticketTotalPrice
        }
    }
}
