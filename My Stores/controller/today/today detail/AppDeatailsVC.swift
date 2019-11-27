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
    fileprivate let ratingCellId = "ratingCellId"
    
    var appResult:Result?
    var ratings:RatingModel?
    
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
        fetchData()
//        navigationItem.title = appResult?.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppTodayDetailCell
        cell.apps = appResult
        return cell
        }else if indexPath.item == 1 {
            let cellPre = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! AppPreiviewDetailCell
            cellPre.appPreiviewHorizental.appsArray = self.appResult
            cellPre.appPreiviewHorizental.collectionView.reloadData()
            return cellPre
        }else {
            let cellRate = collectionView.dequeueReusableCell(withReuseIdentifier: ratingCellId, for: indexPath) as! AppDetailRatingCell
            cellRate.ratingHorizentalCollectionView.rateing = self.ratings?.feed.entry ?? []
            cellRate.ratingHorizentalCollectionView.collectionView.reloadData()
            return cellRate
        }
    }
    
    
    
    //MARK: -user methods
    
    func fetchData()  {
        let url = "https://itunes.apple.com/lookup?id=\(appId)"
        Services.shared.fetchGenericJSONData(urlString: url) { (res:AppResultModel? , err) in
            if let err = err {
                print("error        ",err.localizedDescription)
            }
            self.appResult =  res?.results.first
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId)/sortby=mostrecent/json?l=en&cc=us"
        Services.shared.fetchGenericJSONData(urlString: reviewsUrl) { (rate:RatingModel?, err) in
            self.ratings = rate
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 280
        
        if indexPath.item == 0 {
            // calculate the necessary size for our cell somehow
            let dummyCell = AppTodayDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.apps = appResult
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimatedSize.height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 280
        }
        
        return .init(width: view.frame.width, height: height)
    }
    
    override func setupCollection() {
        collectionView.backgroundColor = .white
        collectionView.register(AppTodayDetailCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppPreiviewDetailCell.self, forCellWithReuseIdentifier: previewCellId)
        collectionView.register(AppDetailRatingCell.self, forCellWithReuseIdentifier: ratingCellId)
    }
   
    
}
