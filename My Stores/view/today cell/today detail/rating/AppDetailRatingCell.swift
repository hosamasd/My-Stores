//
//  AppDetailRatingCell.swift
//  My Stores
//
//  Created by hosam on 11/25/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppDetailRatingCell: BaseCell {
    
    let titleLabel =  UILabel(text: "Preview & Ratings", font: .systemFont(ofSize: 30))
    
    let ratingHorizentalCollectionView = AppDetailRatingHorizentalVC()
    
    override func setupViews() {
        
        stack(titleLabel,ratingHorizentalCollectionView.view, spacing: 8).withMargins(.init(top: 16, left: 16, bottom: 16, right: 0))
    }
}
