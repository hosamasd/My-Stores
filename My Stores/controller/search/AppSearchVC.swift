//
//  AppSearchVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

class AppSearchVC: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollection()  {
        collectionView.backgroundColor = .blue
    }
}
