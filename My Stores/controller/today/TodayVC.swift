//
//  TodayVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

class TodayVC: BaseVC {
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ac  = UIActivityIndicatorView(style: .whiteLarge)
        ac.color = .black
        ac.startAnimating()
//        aiv.hidesWhenStopped = true
        return ac
    }()
    
    fileprivate let cellId = "cellId"
    fileprivate let headerCellId = "headerCellId"
    var groups = [AppGroupModel]()
    var groupsSocial = [SocialAModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
        
        let group = self.groups[indexPath.item]
        
        cell.titleLabel.text = group.feed.title
        cell.appTodayHorizental.appGroups = group
        cell.appTodayHorizental.collectionView.reloadData()
        cell.appTodayHorizental.didSelectHandler = { [weak self] res in
            let newVC = AppDeatailsVC(appId: res.id)
            newVC.navigationItem.title = res.name
            print(res.id)
            self?.navigationController?.pushViewController(newVC, animated: true)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! TodayHeaderCell
        
        header.appTodayHorizental.socialAppArray = groupsSocial
        header.appTodayHorizental.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    //MARK: -user methods
    
    func fetchData()  {
        
        var group1: AppGroupModel?
        var group2: AppGroupModel?
        var group3: AppGroupModel?
        //to sync data that can be fetched
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Services.shared.fetchFreeApps { (apps, err) in
            dispatchGroup.leave()
            group2 = apps
        }
        
        dispatchGroup.enter()
        
        Services.shared.fetchAppGroups { (apps, err) in
            dispatchGroup.leave()
            group3 = apps
        }
        
        dispatchGroup.enter()
        Services.shared.fetchTopGrossing { (apps, err) in
            dispatchGroup.leave()
            group1 = apps
        }
        
        dispatchGroup.enter()
        Services.shared.fetchSocialApps { (social, err) in
            dispatchGroup.leave()
            self.groupsSocial = social ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            
            self.activityIndicatorView.stopAnimating()
            
            if let group = group3 {
                self.groups.append(group)
            }
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    override func setupCollection() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        collectionView.backgroundColor = .white
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(TodayHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellId)
    }
    
   
 
}
