//
//  SearchCell.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit
import SDWebImage

class SearchCell: BaseCell {
    
    var apps:Result? {
        didSet{
            guard let app = apps else { return  }
            self.appNameLabel.text = app.trackName
            self.appCategLabel.text = app.primaryGenreName
            
            
            self.appImage.sd_setImage(with: URL(string: app.artworkUrl100))
            self.appScreenShot1Image.sd_setImage(with: URL(string: app.screenshotUrls![0]))
            
            if app.screenshotUrls!.count > 1 {
                self.appScreenShot2Image.sd_setImage(with: URL(string: app.screenshotUrls![1]))
            }
            if app.screenshotUrls!.count > 2 {
                self.appScreenShot3Image.sd_setImage(with: URL(string: app.screenshotUrls![2]))
            }
            
            
            self.ratingsLabel.text = "Rating: \(app.averageUserRating ?? 0)"
        }
    }
    
    let appImage:UIImageView = {
        let im = UIImageView(image: #imageLiteral(resourceName: "close_button"))
        im.layer.cornerRadius = 12
        im.clipsToBounds = true
        im.constrainWidth(constant: 64)
        im.constrainHeight(constant: 64)
        return im
    }()
    let appNameLabel=UILabel(text: "subway", font: .systemFont(ofSize: 20), textColor: .black)
    let appCategLabel=UILabel(text: "games", font: .systemFont(ofSize: 17), textColor: .black)
    let ratingsLabel=UILabel(text: "rate", font: .systemFont(ofSize: 16), textColor: .black)
       
    lazy var getButton:UIButton = {
        let bt  = UIButton()
        bt.setTitle("Get", for: .normal)
        bt.layer.cornerRadius = 16
        bt.backgroundColor = UIColor(white: 0.95, alpha: 1)
        bt.setTitleColor(.blue, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.addTarget(self, action: #selector(handleGet), for: .touchUpInside)
        bt.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bt.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return bt
    }()
    lazy var appScreenShot1Image = createScreenSots()
    lazy var appScreenShot2Image = createScreenSots()
    lazy var appScreenShot3Image = createScreenSots()
    
    
    
    
    
    override func setupViews()  {
        
        let stacksLabel = stack(appNameLabel,appCategLabel,ratingsLabel)
        let infoAppStack = hstack(appImage,stacksLabel,getButton, spacing: 12, alignment: .center)
        let screenShotStacks = hstack(appScreenShot1Image,appScreenShot2Image,appScreenShot3Image, spacing: 12, distribution: .fillEqually)
        let mainStacks = stack(infoAppStack,screenShotStacks,spacing: 16)
        
        stack(mainStacks).withMargins(.init(top: 16, left: 16, bottom: 0, right: 16))
        
    }
    
    func createScreenSots() -> UIImageView {
        let im = UIImageView()
        im.backgroundColor = .blue
        im.layer.cornerRadius = 8
        im.clipsToBounds = true
        im.layer.borderWidth = 0.5
        im.contentMode = .scaleAspectFill
        im.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return im
    }
    
    @objc func handleGet(){
        print(123)
    }
}
