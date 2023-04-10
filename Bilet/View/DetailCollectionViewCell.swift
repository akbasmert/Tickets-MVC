//
//  DetailCollectionViewCell.swift
//  Bilet
//
//  Created by Mert AKBAŞ on 3.04.2023.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var label: UILabel!
    
    func updateViewColor( color: UIColor) {
            uiView.layer.cornerRadius = 10
            uiView.backgroundColor = color
        }
}
