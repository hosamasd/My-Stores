//
//  AppCell.swift
//  My Stores
//
//  Created by hosam on 11/25/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppCell: AppBaseItemCell {
    
    override var items: AppItem!{
        didSet{
            guard let  item = items else { return  }
            self.categoryLabel.text = item.category
            self.titleLabel.text = item.title
            self.centerImage.image =  item.image
            self.imageContainerView.backgroundColor = item.backgroundColor
            backgroundColor = item.backgroundColor
        }
    }
    
    let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 28))
    let descriptionLabel = UILabel(text: "All the tools and apps you need to intelligently organize your life the right way.", font: .systemFont(ofSize: 16), numberOfLines: 3)
    
    let centerImage:UIImageView = {
        let im = UIImageView(image: #imageLiteral(resourceName: "garden"))
        im.clipsToBounds = true
        return im
    } ()
    var imageContainerView = UIView()
    var topConstraint:NSLayoutConstraint!
    
    
    override func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 16
        imageContainerView = UIView()
        imageContainerView.addSubview(centerImage)
        centerImage.centerInSuperview(size: .init(width: 200, height: 200))
        
        let stackViews = getStacks(views: categoryLabel,titleLabel,imageContainerView,descriptionLabel, axis: .vertical, space: 8)
        addSubview(stackViews)
        
        stackViews.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        topConstraint = stackViews.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        topConstraint.isActive = true
    }


}
