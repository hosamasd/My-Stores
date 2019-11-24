//
//  Services.swift
//  My Stores
//
//  Created by hosam on 11/24/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class Services {
    
    static let shared = Services()
    
    func fetchApps(searchText:String,completion: @escaping (AppResultModel?, Error?) ->())  {
        let mainUrl = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
        fetchGenericJSONData(urlString: mainUrl, completion: completion)
        
    }
    
    func fetchGenericJSONData<T: Codable>(urlString:String, completion: @escaping (T?, Error?) -> ())  {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}
