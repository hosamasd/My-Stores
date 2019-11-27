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
    
    fileprivate let mode:Mode!
    
    init(mode:Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Mode {
        case small,fullScreen
    }
    
    lazy var closeButton:UIButton = {
        let bt = UIButton()
        bt.setImage(#imageLiteral(resourceName: "close_button").withRenderingMode(.alwaysOriginal), for: .normal)
        bt.tintColor = UIColor.darkGray
        bt.addTarget(self, action: #selector(handleDismis), for: .touchUpInside)
        bt.constrainWidth(constant: 80)
        bt.constrainHeight(constant: 40)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override var prefersStatusBarHidden: Bool {return true}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mode == .fullScreen ? apps.count : min(4,apps.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MultiAppListCell
        let app = apps[indexPath.item]

        cell.appFeeds = app
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return mode == .fullScreen  ? .init(top: 60, left: 24, bottom: 16, right: 24) : .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if mode ==  .fullScreen {
            return .init(width: view.frame.width - 48, height: 74)
        }
        let height:CGFloat = (view.frame.height - 3 * spacing) / 4
        
        return .init(width: view.frame.width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appId = apps[indexPath.item].id
        let full = AppDeatailsVC(appId: appId)
        
        navigationController?.pushViewController(full, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    override func setupCollection() {
        
        if mode == .fullScreen {
            setupCloseButton()
            navigationController?.isNavigationBarHidden = true
        }
        
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        collectionView.register(MultiAppListCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupCloseButton()  {
        view.addSubview(closeButton)
        
        closeButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 16, left: 0, bottom: 0, right: 16))
    }
    
   @objc func handleDismis()  {
        dismiss(animated: true, completion: nil)
    }
    
}
