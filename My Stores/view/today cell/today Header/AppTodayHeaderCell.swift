//
//  AppTodayHeaderCell.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppTodayHeaderCell: BaseCell {
    
    let titleLabel = UILabel(text: "App section", font: .systemFont(ofSize: 12), textColor: .blue)
    let subTitleLabel = UILabel(text: "App section \n dsfdsf", font: .systemFont(ofSize: 26), textColor: .black,textAlignment: .left,numberOfLines: 2)
    
    let appImageView:UIImageView = {
        let im = UIImageView()
        im.layer.cornerRadius = 12
        im.clipsToBounds = true
        im.backgroundColor = .red
        return im
    }()
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(titleLabel,subTitleLabel,appImageView, spacing: 4)
    }
}
