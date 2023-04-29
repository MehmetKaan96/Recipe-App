//
//  CustomTabBarController.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 22.04.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchButton()
        // Do any additional setup after loading the view.
    }
    
    func createSearchButton() {
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        
        var centerButtonFrame = searchButton.frame
        centerButtonFrame.origin.y = (view.bounds.height - centerButtonFrame.height) - 60
        centerButtonFrame.origin.x = view.bounds.width/2.4
        searchButton.frame = centerButtonFrame
        searchButton.layer.cornerRadius = 35
        view.addSubview(searchButton)
        searchButton.setImage(UIImage(named: "searchicon"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        view.addSubview(searchButton)
        view.layoutIfNeeded()
    }
    
    @objc func searchButtonTapped() {
        //To Do: Segue
    }
    
}
