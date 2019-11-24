//
//  BaseVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class BaseVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupNavigation()
    }
    
    func setupCollection()  {
        
    }
    
    func setupNavigation()  {
        
    }
    
   
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
