//
//  AppTodayMultiCell.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

class AppTodayMultiCell: BaseCell {
    
    
    var appFeeds:FeedResult? {
        didSet{
            guard let app = appFeeds else { return }

            guard  let url = URL(string: app.artworkUrl100) else {return}

            self.appImage.sd_setImage(with: url)
            self.appNameLabel.text = app.name
            self.appCompanyLabel.text = app.artistName
        }
    }
    
    let appImage:UIImageView = {
        let im = UIImageView()
        im.layer.cornerRadius = 12
        im.clipsToBounds = true
        im.constrainWidth(constant: 64)
        im.constrainHeight(constant: 54)
        im.backgroundColor = .red
        return im
    }()
    
    let appNameLabel=UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let appCompanyLabel=UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    lazy var getButton:UIButton = {
        let bt  = UIButton()
        bt.setTitle("Get", for: .normal)
        bt.layer.cornerRadius = 16
        bt.backgroundColor = UIColor(white: 0.95, alpha: 1)
        bt.setTitleColor(.blue, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //        bt.addTarget(self, action: #selector(handleGet), for: .touchUpInside)
        bt.constrainHeight(constant: 32)
        bt.constrainWidth(constant: 80)
        return bt
    }()
    
    override func setupViews() {
        backgroundColor = .white
         let stackLabel = stack(appNameLabel,appCompanyLabel, spacing: 4)
        hstack(appImage,stackLabel,getButton, spacing: 16, alignment: .center)
        
    }
}
