//
//  MultAappCell.swift
//  My Stores
//
//  Created by hosam on 11/27/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class MultAappCell: AppBaseItemCell {
    
    override var items: AppItem!{
        didSet{
            guard let  item = items else { return  }
            self.categoryLabel.text = item.category
            self.titleLabel.text = item.title
            backgroundColor = item.backgroundColor
        }
    }
    
    let categoryLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 28),numberOfLines: 2)
    
    var multiApp = MultiAppListVC()
    
    override func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 16
        
        stack(categoryLabel,titleLabel,multiApp.view, spacing: 4).withMargins(.init(top: 16, left: 16, bottom: 16, right: 16))
    }
}
