//
//  AppTodayHeaderHorizentalVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppTodayHeaderHorizentalVC: BaseVC {
    
     var socialAppArray = [SocialAModel]()
     fileprivate let cellId = "cellId"
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialAppArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppTodayHeaderCell
        let social = socialAppArray[indexPath.item]
        
        cell.titleLabel.text = social.name
        cell.subTitleLabel.text = social.tagline
        cell.appImageView.sd_setImage(with: URL(string: social.imageUrl ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    override func setupCollection() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = .white
         collectionView.register(AppTodayHeaderCell.self, forCellWithReuseIdentifier: cellId)
    }
}
