//
//  AppFullScreenHeaderCell.swift
//  My Stores
//
//  Created by hosam on 11/25/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

class AppFullScreenHeaderCell: UITableViewCell {
    
    let mainImageCell = AppCell()
    lazy var closeButton:UIButton = {
        let bt = UIButton()
        bt.setImage(#imageLiteral(resourceName: "close_button").withRenderingMode(.alwaysTemplate), for: .normal)
       
        bt.constrainWidth(constant: 80)
        bt.constrainHeight(constant: 40)
        return bt
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()  {
        stack(mainImageCell)
        
        stack(hstack(UIView(),closeButton),UIView()).withMargins(.init(top: 12, left: 0, bottom: 0, right: 12))
    }
    
   
}
