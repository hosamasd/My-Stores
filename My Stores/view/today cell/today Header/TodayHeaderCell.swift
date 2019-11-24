//
//  TodayHeaderCell.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class TodayHeaderCell: UICollectionReusableView {
    
   
    let appTodayHorizental = AppTodayHeaderHorizentalVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()  {
        backgroundColor = .white
        
        stack(appTodayHorizental.view).withMargins(.init(top: 8, left: 16, bottom: 16, right: 0))
    }
}
