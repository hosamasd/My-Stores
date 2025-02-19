//
//  AppDetailPreiviewHorizentalVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppDetailPreiviewHorizentalVC: BaseVC {
    
   
    fileprivate let cellId = "cellId"
     var appsArray:Result?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsArray?.screenshotUrls?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppDetailPreiviewScreenshotCell
        let screen = appsArray?.screenshotUrls?[indexPath.item]
        
        cell.appScreenShotImage.sd_setImage(with: URL(string: screen ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: view.frame.height)
    }
    
    override func setupCollection() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailPreiviewScreenshotCell.self, forCellWithReuseIdentifier: cellId)
    }
    
   
    
}
