//
//  MultiAppListVC.swift
//  My Stores
//
//  Created by hosam on 11/27/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class MultiAppListVC: BaseVC {
    
    fileprivate let spacing:CGFloat = 16
    fileprivate let cellId = "cellId"
    var apps = [FeedResult]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(4,apps.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MultiAppListCell
        let app = apps[indexPath.item]

        cell.appFeeds = app
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height:CGFloat = (view.frame.height - 3 * spacing) / 4
        
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    override func setupCollection() {
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        collectionView.register(MultiAppListCell.self, forCellWithReuseIdentifier: cellId)
    }
    
   
    
}
