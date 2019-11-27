//
//  TodayItem.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

struct AppItem {
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    let apps:[FeedResult]
//
    let cellType:CellType
    
    enum CellType:String {
        case single, multi
        
    }
    
}
