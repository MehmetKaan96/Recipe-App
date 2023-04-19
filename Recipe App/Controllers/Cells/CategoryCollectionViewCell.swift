//
//  CategoryCollectionViewCell.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor(named: "BackgroundColor")
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1.5
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
}
