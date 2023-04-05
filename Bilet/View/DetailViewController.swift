//
//  DetailViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 3.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seatChoose: UILabel!
    @IBOutlet weak var ticketPayButton: UIButton!
    @IBOutlet weak var seatPrice: UILabel!
    
    var bus: Bus?
    var startCity: String = ""
    var lastCity: String = ""
    var date: String = ""
    var ticketTotalPrice: String = "0"
    
    var seatNumber: [Int] = [1,2,3,3,4,5,6,6,7,8,9,9,10,11,12,12,13,14,15,15,16,17,18,18,19,20,21,21,22,23,24,24,25,26,27,27,28,29,30,30,31,32,33,33,34,35,36,36,37,38,39,39]
    var soldSeats: [Int] = [1, 5,6, 7,39 ,23]
    var secretSeats: [Int] = [2,6,10,14,18,22,26,30,34,38,42,46,50]
    var reservationSeats: [Int] = []
    var ticketNumber: [Int] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(UINib(nibName: "DetailBusCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "detailBusCell")

        ticketPayButton.alpha = 0.8
        
        imageView.image = UIImage(named: bus?.imageName ?? "ali")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ticketPayButton(_ sender: Any) {
        if reservationSeats.isEmpty {
            let alertSeatPay =   UIAlertController(title: "", message: "Lütfen koltuk seçiniz.", preferredStyle: .alert)
            alertSeatPay.addAction(UIAlertAction(title: "Tamam", style: .destructive, handler: nil))
              self.present(alertSeatPay,animated: true)
        } else {
            performSegue(withIdentifier: "toPaymentVC", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPaymentVC" {
            let destinationPaymentVC = segue.destination as! PaymentViewController
            destinationPaymentVC.ticketTotalPrice = ticketTotalPrice
            destinationPaymentVC.bus = bus
            destinationPaymentVC.date = date
            destinationPaymentVC.lastCity = lastCity
            destinationPaymentVC.startCity = startCity
            destinationPaymentVC.ticketNumber = ticketNumber
        }
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 4
        } else {
            return seatNumber.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let   cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailBusCell", for: indexPath) as!
            DetailBusCollectionViewCell
            if indexPath.row == 3{
                cell.isHidden = false
            } else {
                cell.isHidden = true
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDetail", for: indexPath) as! DetailCollectionViewCell
            cell.uiView.layer.cornerRadius = 10
            
            if secretSeats.contains(indexPath.row) {
                cell.updateViewColor(color: .white)
            } else {
                cell.label.text = String(seatNumber[indexPath.row])
                if soldSeats.contains(indexPath.row) {
                    cell.updateViewColor(color: .systemBlue)
                } else {
                    cell.uiView.backgroundColor = .lightGray
                }
             }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if let cell = collectionView.cellForItem(at: indexPath) as? DetailCollectionViewCell {

            if !secretSeats.contains(indexPath.row){
                
                if soldSeats.contains(indexPath.row) {
                    let alertSeat =   UIAlertController(title: "", message: "Koltuk satılmış. Lütfen farklı bir koltuk seçiniz.", preferredStyle: .actionSheet)
                    alertSeat.addAction(UIAlertAction(title: "Tamam", style: .destructive, handler: nil))
                      self.present(alertSeat,animated: true)
                    
                } else if reservationSeats.contains(indexPath.row) {
                    cell.updateViewColor(color: .lightGray)
                    reservationSeats = reservationSeats.filter { $0 != indexPath.row }
                    ticketNumber = ticketNumber.filter { $0 != seatNumber[indexPath.row]}
                    
                } else if reservationSeats.count == 5 {
                  let alertReservation =   UIAlertController(title: "", message: "5 ten fazla koltuk seçemezsiniz.", preferredStyle: .alert)
                     alertReservation.addAction(UIAlertAction(title: "Tamam", style: .destructive, handler: nil))
                     self.present(alertReservation,animated: true)
                } else {
                    cell.updateViewColor(color: .systemRed)
                    reservationSeats.append(indexPath.row)
                    ticketNumber.append(seatNumber[indexPath.row])
                }
            }
          
            if reservationSeats.isEmpty {
                ticketPayButton.alpha = 0.8
            } else {
                ticketPayButton.alpha = 1
            }
            seatChoose.text = "Koltuk Seçiminiz: \(ticketNumber.map { String($0) }.joined(separator: ", "))"
            ticketTotalPrice = String(Int((bus?.price!.replacingOccurrences(of: " TL", with: ""))!)! * reservationSeats.count) + "₺"
            seatPrice.text = ticketTotalPrice
            print(ticketNumber)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 1.0, bottom: 2.0, right: 1.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 3 - gridLayout.minimumInteritemSpacing
        return CGSize(width:32, height:32)
    }
}
