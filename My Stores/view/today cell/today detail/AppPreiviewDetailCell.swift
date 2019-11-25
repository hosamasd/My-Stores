//
//  AppPreiviewDetailCell.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppPreiviewDetailCell: BaseCell {
    
    let titleLabel = UILabel(text: "Preiview", font: .systemFont(ofSize: 18), textColor: .black)
     let appPreiviewHorizental = AppDetailPreiviewHorizentalVC()
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(titleLabel,appPreiviewHorizental.view, spacing: 8).withMargins(.init(top: 0, left: 16, bottom: 0, right: 0))
    }
}
