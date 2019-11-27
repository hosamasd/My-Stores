//
//  AppsListVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

class AppsListVC: BaseVC {
    
    
    static let cellSize: CGFloat = 500
    var appFullScreenOffset:CGFloat = 0
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .darkGray
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
   
//    var items  = [
//         .init(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize your life the right way.", backgroundColor: .white,cellType:.single),
//          AppItem.init(category: "The daily list", title: "Test-Drive these carPlay Apps ", image: #imageLiteral(resourceName: "holiday"), description: "", backgroundColor: .white,cellType: .multi),
//       AppItem.init(category: "Holiday", title: "travel on a badget", image: #imageLiteral(resourceName: "holiday"), description: "to intelligently organize your life the right way.", backgroundColor: #colorLiteral(red: 0.9925484061, green: 0.9600889087, blue: 0.7310721278, alpha: 1),cellType:.single),
//
//      ]
    
     var items  = [AppItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
//        fetchApps()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIId = items[indexPath.item].cellType.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIId, for: indexPath) as! AppBaseItemCell
        cell.items = items[indexPath.item]
        
        return cell
    }
    
    var startingFrame:CGRect?
    var appFullVC:AppFullScreenVC!
//    var topCons,leadCons,widthC,heightC:NSLayoutConstraint!
     var anchorConstraints:AnchoredConstraints?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        
        let appFullScreen = AppFullScreenVC(item: item)
        let fullScreenView = appFullScreen.view!
        appFullScreen.handleCloseClosure = {
           self.handleDismiss()
        }
        
         fullScreenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
        self.collectionView.isUserInteractionEnabled = false
        view.addSubview(fullScreenView)
        addChild(appFullScreen)
         self.appFullVC = appFullScreen
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return  }
        guard let startFrame = cell.superview?.convert(cell.frame, to: nil) else { return  }
        startingFrame = startFrame
       
         self.anchorConstraints = fullScreenView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: startFrame.origin.y , left: startFrame.origin.x, bottom: 0, right: 0),size: .init(width: startFrame.width, height: startFrame.height))
       
        view.layoutIfNeeded()
        fullScreenView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
            self.anchorConstraints?.top?.constant = 0
            self.anchorConstraints?.leading?.constant = 0
            self.anchorConstraints?.width?.constant = self.view.frame.width
            self.anchorConstraints?.height?.constant = self.view.frame.height
            self.view.layoutIfNeeded() // start animation
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            
            guard let cel = self.appFullVC.tableView.cellForRow(at: [0,0]) as? AppFullScreenHeaderCell else {return}
            //            cel.closeButton.alpha = 0 // to hide when minmize using draging cell
            //        self.appFullVC..alpha = 0 // to hide when minmize using draging cell
            cel.mainImageCell.topConstraint.constant = 48
            cel.layoutIfNeeded()
        }, completion:  nil)
    }
    
    @objc func handleDismiss()  {
    UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
        
//        self.blurVisualEffectView.alpha = 0
        self.appFullVC.view.transform = .identity
        
        self.appFullVC.tableView.contentOffset = .zero
        
        guard let startingFrame = self.startingFrame else{return}
        self.anchorConstraints?.top?.constant = startingFrame.origin.y
        self.anchorConstraints?.leading?.constant = startingFrame.origin.x
        self.anchorConstraints?.width?.constant = startingFrame.width
        self.anchorConstraints?.height?.constant = startingFrame.height
        
        guard let cel = self.appFullVC.tableView.cellForRow(at: [0,0]) as? AppFullScreenHeaderCell else {return}
        //            cel.closeButton.alpha = 0 // to hide when minmize using draging cell
//        self.appFullVC..alpha = 0 // to hide when minmize using draging cell
        cel.mainImageCell.topConstraint.constant = 24
        cel.layoutIfNeeded()
    }) { (_) in
        
        self.appFullVC.view.removeFromSuperview()
        self.appFullVC.removeFromParent()
        self.collectionView.isUserInteractionEnabled = true
        
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: AppsListVC.cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    //MARK: -user methods
    
    func fetchData()  {
        
        var group1: AppGroupModel?
        var group2: AppGroupModel?
        //to sync data that can be fetched
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Services.shared.fetchFreeApps { (apps, err) in
           
            group2 = apps
             dispatchGroup.leave()
        }
        
       
        
       
        
        dispatchGroup.enter()
        Services.shared.fetchTopGrossing { (apps, err) in
//            dispatchGroup.leave()
            group1 = apps
             dispatchGroup.leave()
        }
        
//        dispatchGroup.enter()
//        Services.shared.fetchSocialApps { (social, err) in
//            dispatchGroup.leave()
//            self.groupsSocial = social ?? []
//        }
        
        dispatchGroup.notify(queue: .main) {
            print(456)
            self.activityIndicatorView.stopAnimating()
            

            self.items = [  .init(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize your life the right way.", backgroundColor: .white, apps: [],cellType:.single),
                            AppItem.init(category: "The daily list", title: group1?.feed.title ?? "", image: #imageLiteral(resourceName: "holiday"), description: "", backgroundColor: .white, apps: group1?.feed.results ?? [],cellType: .multi),
                             AppItem.init(category: "The daily list", title: group2?.feed.title ?? "", image: #imageLiteral(resourceName: "holiday"), description: "", backgroundColor: .white, apps: group2?.feed.results ?? [] ,cellType: .multi),
                            AppItem.init(category: "Holiday", title: "travel on a badget", image: #imageLiteral(resourceName: "holiday"), description: "to intelligently organize your life the right way.", backgroundColor: #colorLiteral(red: 0.9925484061, green: 0.9600889087, blue: 0.7310721278, alpha: 1), apps: [],cellType:.single)
                ]
            
            self.collectionView.reloadData()
        }
    }
    
    override func setupCollection()  {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.9555082917, green: 0.9493837953, blue: 0.9556146264, alpha: 1)
        
         collectionView.register(AppCell.self, forCellWithReuseIdentifier: AppItem.CellType.single.rawValue)
        collectionView.register(MultAappCell.self, forCellWithReuseIdentifier: AppItem.CellType.multi.rawValue)
    }
}
