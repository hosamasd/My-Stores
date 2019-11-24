//
//  AppGroupModel.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import Foundation

struct AppGroupModel: Codable {
    
    let feed:Feed
    
}

struct Feed: Codable {
    let title: String
    let id: String
    
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    let id, artistName, artworkUrl100, name: String
    
    
}

