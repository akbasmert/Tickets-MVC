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
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        uiView.backgroundColor = .yellow
//        uiView.layer.cornerRadius = 10
//    }
//
//    required init?(coder: NSCoder) {
//           super.init(coder: coder)
//       }
    
    func updateViewColor( color: UIColor) {
        
        uiView.layer.cornerRadius = 10
       
            uiView.backgroundColor = color
         
        }
}
