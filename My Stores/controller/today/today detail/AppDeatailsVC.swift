//
//  AppDeatailsVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class AppDeatailsVC: BaseVC {
    
    fileprivate let cellId = "cellId"
     fileprivate let previewCellId = "previewCellId"
    let dumy = "This rectangle defines the size and position of the view in its superview’s coordinate system. Use this rectangle during layout operations to set the size and position the view. Setting this property changes the point specified by the center property and changes the size in the bounds rectangle accordingly. The coordinates of the frame rectangle are always specified in points"
    
    //dependency
    fileprivate let appId:String
    
    init(appId:String) {
        self.appId = appId
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppTodayDetailCell
        cell.realeaseLabel.text = dumy
        return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! AppPreiviewDetailCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimatedCellSize = AppTodayDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 10000))
        estimatedCellSize.realeaseLabel.text = dumy
//        estimatedCellSize.item = items[indexPath.item]
        estimatedCellSize.layoutIfNeeded()
        
        let estimatedHeight = estimatedCellSize.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        
        
        return .init(width: view.frame.width, height: estimatedHeight.height)
    }
    
    override func setupCollection() {
        collectionView.backgroundColor = .white
        collectionView.register(AppTodayDetailCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppPreiviewDetailCell.self, forCellWithReuseIdentifier: previewCellId)
    }
   
    
}
