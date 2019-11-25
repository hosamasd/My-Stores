//
//  AppDetailPreiviewScreenshotCell.swift
//  My Stores
//
//  Created by hosam on 11/25/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppDetailPreiviewScreenshotCell: BaseCell {
    
    let appScreenShotImage = UIImageView(cornerRdius: 12)
    var apps:Result?
    
    
    override func setupViews() {
        addSubview(appScreenShotImage)
        
        stack(appScreenShotImage)
    }
}
