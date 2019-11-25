//
//  RatingAppCell.swift
//  My Stores
//
//  Created by hosam on 11/25/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

class RatingAppCell: BaseCell {
    
    var rates:Entry! {
        didSet{
            self.titleLabel.text = rates?.title.label
            self.authorLabel.text = rates?.author.name.label
            
            self.bodyLabel.text = rates?.content.label
            for(index,view) in starsStackView.arrangedSubviews.enumerated(){
                if let ratingInt = Int(rates!.rating.label ) {
                    view.alpha = index >= ratingInt ? 0 : 1
                }
                
            }
        }
    }
    
    let titleLabel =  UILabel(text: "review title ", font: .systemFont(ofSize: 18))
    let authorLabel =   UILabel(text: "hosam mohamed ", font: .systemFont(ofSize: 18),textColor: #colorLiteral(red: 0.7464761734, green: 0.7457280755, blue: 0.7608093023, alpha: 1),textAlignment: .right)
    
    
    let starsStackView:UIStackView = {
        var arrangedViews = [ UIView]()
        (0..<5).forEach({ (_) in
            let im = UIImageView(image: #imageLiteral(resourceName: "star"))
            im.constrainWidth(constant: 24)
            im.constrainHeight(constant: 24)
            arrangedViews.append(im)
        })
        arrangedViews.append(UIView())
        let stack = UIStackView(arrangedSubviews: arrangedViews)
        return stack
    }()
    
    
    let bodyLabel =  UILabel(text: "this is our app for creating some bug \n iin our layout \n sdfnsdf dfds e ", font: .systemFont(ofSize: 16),textColor: #colorLiteral(red: 0.4171162844, green: 0.4154297411, blue: 0.4452013373, alpha: 1), numberOfLines: 0)
    
    override func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9466946721, green: 0.9417948723, blue: 0.9741321206, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        
        //make it small with large content or collapse
        titleLabel.setContentCompressionResistancePriority(.init(0), for:   .horizontal)
        
        let first = hstack(titleLabel,authorLabel, spacing: 8)
 stack(first,starsStackView,bodyLabel, spacing: 4).withMargins(.init(top: 16, left: 16, bottom: 0, right: 16))
    }
}
