//
//  DetailBusCollectionViewCell.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 4.04.2023.
//

import UIKit

class DetailBusCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.transform = CGAffineTransform(rotationAngle: 55)

    }

}
