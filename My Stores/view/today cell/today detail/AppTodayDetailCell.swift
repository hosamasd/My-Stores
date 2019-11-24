//
//  AppTodayDetailCell.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppTodayDetailCell: BaseCell {
    
    let appImage:UIImageView = {
        let im = UIImageView()
        im.layer.cornerRadius = 12
        im.clipsToBounds = true
        im.constrainWidth(constant: 104)
        im.constrainHeight(constant: 104)
        im.backgroundColor = .red
        return im
    }()
    
    let appNameLabel=UILabel(text: "App Name \n ompany Name \n vfvv", font: .systemFont(ofSize: 16),numberOfLines: 3)
    let whatNewLabel=UILabel(text: "What's news", font: .systemFont(ofSize: 18))
    let realeaseLabel = UILabel(text: "release ", font: .systemFont(ofSize: 16), textColor: .lightGray,numberOfLines: 0)
    
    lazy var priceGetButton:UIButton = {
        let bt  = UIButton()
        bt.setTitle("4.99$", for: .normal)
        bt.layer.cornerRadius = 16
        bt.backgroundColor = #colorLiteral(red: 0.306956023, green: 0.4527258277, blue: 0.9890493751, alpha: 1)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //        bt.addTarget(self, action: #selector(handleGet), for: .touchUpInside)
        bt.constrainHeight(constant: 32)
        bt.constrainWidth(constant: 92)
        return bt
    }()
    
    override func setupViews() {
        backgroundColor = .white
        
        let first = hstack(appImage,stack(appNameLabel,hstack(priceGetButton,UIView()), spacing: 4), spacing: 8)
        
        stack(first,whatNewLabel,realeaseLabel, spacing: 8).withMargins(.init(top: 8, left: 16, bottom: 8, right: 16))
    }
}
