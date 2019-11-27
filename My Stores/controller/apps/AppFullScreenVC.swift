//
//  AppFullScreenVC.swift
//  My Stores
//
//  Created by hosam on 11/25/19.
//  Copyright © 2019 hosam. All rights reserved.
//


import UIKit

class AppFullScreenVC: UITableViewController {
    
    let cellId = "cellId"
   fileprivate let item:AppItem!

    init(item:AppItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var handleCloseClosure:(() ->())?
//    lazy var closeButton:UIButton = {
//        let bt = UIButton()
//        bt.setImage(#imageLiteral(resourceName: "close_button").withRenderingMode(.alwaysOriginal), for: .normal)
//        bt.addTarget(self, action: #selector(handleDismis), for: .touchUpInside)
//        bt.constrainWidth(constant: 80)
//        bt.constrainHeight(constant: 40)
//        return bt
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        
        setupTableViews()
        setupCloseButton()
        
        setupFloatinControls()
    }
    
    
    
    
//    @objc func handleTapped(){
//        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
//            self.floatingControlmainView.transform = .init(translationX: 0, y: -90)
//        })
//    }
    
    func setupFloatinControls()  {
      
        
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapped)))
        
        // add our subviews
        let imageView = UIImageView(cornerRdius: 16)
        imageView.image = item?.image
        imageView.constrainHeight(constant: 68)
        imageView.constrainWidth(constant: 68)
        
        let getButton = UIButton()
        getButton.setTitle("GET", for: .normal)
        getButton.setTitleColor(.white, for: .normal)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.backgroundColor = .darkGray
        getButton.layer.cornerRadius = 16
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        
//        let stackView = UIStackView(arrangedSubviews: [
//            imageView,
//            VerticalStackView(arrangedSubviews: [
//                UILabel(text: "Life Hack", font: .boldSystemFont(ofSize: 18)),
//                UILabel(text: "Utilizing your Time", font: .systemFont(ofSize: 16))
//                ], spacing: 4),
//            getButton
//            ], customSpacing: 16)
        let sssLabel = getStack(views: UILabel(text: "Life Hack", font: .boldSystemFont(ofSize: 18)),
                                UILabel(text: "Utilizing your Time", font: .systemFont(ofSize: 16)), spacing: 4, distribution: .fill, axis: .vertical)
        let stackView = getStack(views: imageView,sssLabel,getButton, spacing: 16, distribution: .fill, axis: .vertical)
        
        
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        stackView.alignment = .center
    }
    
    
    
    //MARK: -UITableView methods
    
  
    
  
    //MARK: -UITableView methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let  cellHeader =  AppFullScreenHeaderCell()
            cellHeader.mainImageCell.layer.cornerRadius = 0
            cellHeader.mainImageCell.items = item
            cellHeader.closeButton.addTarget(self, action: #selector(handleDismis), for: .touchUpInside)
//            cellHeader.mainImageCell.todayItem = item
//            cellHeader.mainImageCell.layer.cornerRadius = 0
//            cellHeader.clipsToBounds = true
            return cellHeader
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AppFullScreenCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
             return 450
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    //MARK: -user methods
    
    func setupTableViews()  {
       
        
        tableView.register(AppFullScreenCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        let height = UIApplication.shared.statusBarFrame.height
        tableView.contentInset = .init(top: 0, left: 0, bottom: height, right: 0)
    }
    
    fileprivate func setupCloseButton() {
//        view.addSubview(closeButton)
//        closeButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 44, left: 0, bottom: 0, right: 8))
    }
    
    //TODO: -handle methods
    
    @objc func handleDismis(sender: UIButton)  {
        sender.isHidden = true
        handleCloseClosure?()
    }
}
