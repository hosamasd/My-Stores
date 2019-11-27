//
//  SearchVC.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class SearchVC: BaseVC {
    
    var appResultsArray = [Result]()
    var userResults = [Result]()
    var timer: Timer?
    
    fileprivate let cellId = "cellId"
     let searchController = UISearchController(searchResultsController: nil)
    
    let defaultTextLable = UILabel(text: "Please enter search item above", font: .systemFont(ofSize: 26), textColor: .black, textAlignment: .center)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupNavigation()
        fetchAppsFromItubes()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         defaultTextLable.isHidden = appResultsArray.count != 0
        return  appResultsArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
        let apps = appResultsArray[indexPath.row]
        
        cell.apps = apps
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let appId = String(self.appResultsArray[indexPath.item].trackId)
        let newVC = AppDeatailsVC(appId: appId)
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func setupCollection()  {
        collectionView.addSubview(defaultTextLable)
        defaultTextLable.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        collectionView.backgroundColor = .white
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    fileprivate   func fetchAppsFromItubes()  {
        Services.shared.fetchApps(searchText: "Instagram") { (res, err) in
            if let err = err {
                print("error to fetch apps ",err.localizedDescription)
                return
            }
            
            self.appResultsArray = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func setupNavigation()  {
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.placeholder = "Search "
    
    }
  
    
}


extension SearchVC: UISearchBarDelegate{
    
    
}

extension SearchVC: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text == nil || searchController.searchBar.text!.isEmpty{
            view.endEditing(true)
            appResultsArray.removeAll()
        }else {
             let text = searchController.searchBar.text!.lowercased()
          
            filterApps(text:text)
        }
        collectionView.reloadData()
    }
    
    func filterApps(text:String)  {
        
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
                
                Services.shared.fetchApps(searchText: text) { (res, err) in
                    if let err = err {
                        print("error to fetch apps ",err.localizedDescription)
                        return
                    }
                    
                    self.appResultsArray = res?.results ?? []
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            })
      }
    
    
}
