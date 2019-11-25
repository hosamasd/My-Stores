//
//  AppDetailRatingHorizentalVC.swift
//  My Stores
//
//  Created by hosam on 11/25/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppDetailRatingHorizentalVC: BaseVC {
    
    fileprivate let cellId = "cellId"
     var rateing = [Entry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rateing.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RatingAppCell
        let rate = rateing[indexPath.item]
        
         cell.rates = rate
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let rate = rateing[indexPath.item]
        let estimatedCellSize = RatingAppCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 10000))
        estimatedCellSize.bodyLabel.text = rate.content.label
        estimatedCellSize.layoutIfNeeded()
        
        let estimatedHeight = estimatedCellSize.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        
        
        return .init(width: estimatedHeight.width  - 48, height: estimatedHeight.height + 16   )
    }
    
    
    //MARK: -user methods
    override func setupCollection() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = .white
        collectionView.register(RatingAppCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 16, right: 16)
    }
   
   
    
}
