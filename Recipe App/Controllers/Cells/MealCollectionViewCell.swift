//
//  MealCollectionViewCell.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderColor = CGColor(red: 252, green: 139, blue: 86, alpha: 1.0)
        self.contentView.layer.borderWidth = 1.5
    }
}
