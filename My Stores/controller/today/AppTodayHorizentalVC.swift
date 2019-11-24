//
//  AppTodayHorizentalVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppTodayHorizentalVC: BaseVC {
    
    fileprivate let cellId = "cellId"
    fileprivate let lineSpacing:CGFloat = 10
    fileprivate let topBottomSpacing:CGFloat = 12
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppTodayMultiCell
        
//        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomSpacing  - 2 * lineSpacing )
        let width = view.frame.width - 32 - 16
        
        return .init(width: width, height: height / 3)
    }
    
    override func setupCollection() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.contentInset = .init(top: topBottomSpacing, left: 0, bottom: topBottomSpacing, right: 16)
        collectionView.backgroundColor = .white
        collectionView.register(AppTodayMultiCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}
