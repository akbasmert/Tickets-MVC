//
//  BustListTableViewCell.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 1.04.2023.
//

import UIKit

class BusListTableViewCell: UITableViewCell {

    @IBOutlet weak var lastCityLabel: UILabel!
    @IBOutlet weak var startCityLabel: UILabel!
    @IBOutlet weak var busStartTime: UILabel!
    @IBOutlet weak var busPrice: UILabel!
    @IBOutlet weak var busRoadTime: UILabel!
    @IBOutlet weak var busSeatStatus: UILabel!
    @IBOutlet weak var busImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
