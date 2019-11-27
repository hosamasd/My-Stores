//
//  MultiAppListVC.swift
//  My Stores
//
//  Created by hosam on 11/27/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class MultiAppListVC: BaseVC {
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MultiAppListCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 70)
    }
    
    override func setupCollection() {
        collectionView.backgroundColor = .white
        collectionView.register(MultiAppListCell.self, forCellWithReuseIdentifier: cellId)
    }
    
   
    
}
