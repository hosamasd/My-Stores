//
//  TodayCell.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class TodayCell: BaseCell {
    
    let titleLabel = UILabel(text: "App section", font: .systemFont(ofSize: 20), textColor: .black)
    let appTodayHorizental = AppTodayHorizentalVC()
    
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(titleLabel,appTodayHorizental.view, spacing: 8).withMargins(.init(top: 0, left: 16, bottom: 0, right: 0))
    }
}
