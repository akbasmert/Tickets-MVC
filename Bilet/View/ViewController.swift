//
//  ViewController.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 1.04.2023.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var startLabel: UITextField!
    @IBOutlet weak var lastLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var animationView: UIView!
    
    var citys = ["Adana", "Ankara", "Bursa", "Gaziantep", "İstanbul", "İzmir", "Konya", "Mersin", "Ordu", "Şanlıurfa", "Antalya"]

    let dateFormatter = DateFormatter()
    var startPickerView: UIPickerView?
    var lastPickerView: UIPickerView?
    var startCity: String = "s"
    var lastCity: String = "l"
    var date: String = "t"
    var tomorrow: Bool = false
    var today: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        dateFormatter.dateFormat = "dd-MM-yyyy"
        date = dateFormatter.string(from: datePicker.date)
        
        startPickerView = UIPickerView()
        lastPickerView = UIPickerView()
        lastPickerView?.dataSource = self
        lastPickerView?.delegate = self
        startPickerView?.delegate = self
        startPickerView?.dataSource = self
        startPickerView?.tag = 0
        lastPickerView?.tag = 1
        startPickerView?.selectRow(1, inComponent: 0, animated: false)
        lastPickerView?.selectRow(8, inComponent: 0, animated: false)
        
        startLabel.inputView = startPickerView
        lastLabel.inputView = lastPickerView
        startLabel.text = "Ankara"
        lastLabel.text = "Ordu"
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
        
        lottieAnimation()
    }
    
    func lottieAnimation(){
        let subAnimationView = LottieAnimationView(name: "animationmap")
        animationView.contentMode = .scaleAspectFit
        animationView.addSubview(subAnimationView)
        subAnimationView.frame = animationView.bounds
        subAnimationView.loopMode = .loop
        subAnimationView.play()
    }
    
    @IBAction func todayButton(_ sender: Any) {
        tomorrow = false
        if !today {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: -1, to: datePicker.date)
            date = dateFormatter.string(from: modifiedDate ?? datePicker.date)
            datePicker.date = modifiedDate ?? datePicker.date
            today = true
        }
    }
    
    @IBAction func tomorrowButton(_ sender: Any) {
        today = false
        if !tomorrow {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: datePicker.date)
            date = dateFormatter.string(from: modifiedDate ?? datePicker.date)
            datePicker.date = modifiedDate ?? datePicker.date
            tomorrow = true
        }
    }
    
    @IBAction func goToButton(_ sender: Any) {
        startCity = startLabel.text ?? ""
        lastCity = lastLabel.text ?? ""
      
        performSegue(withIdentifier: "toBustListVC", sender: nil )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let goToBusListVC = segue.destination as! BusListViewController
        goToBusListVC.startCity = startCity
        goToBusListVC.lastCity = lastCity
        goToBusListVC.date = date
    }
    
    @IBAction func datePicker(_ sender: Any) {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            date = dateFormatter.string(from: datePicker.date)
            view.endEditing(true)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            startLabel.text = citys[row]
        } else {
            lastLabel.text = citys[row]
        }
        self.view.endEditing(true)
    }
}
