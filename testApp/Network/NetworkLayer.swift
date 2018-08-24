//
//  NetworkLayer.swift
//  testApp
//
//  Created by Turvo on 24/08/18.
//  Copyright © 2018 Turvo. All rights reserved.
//

import UIKit

class NetworkLayer: NSObject {
    
    class func makeAPICall(completion: @escaping (([Any]) -> ())) {
        URLSession.shared.dataTask(with: URL(string: "http://www.mocky.io/v2/5b7fae8a3400002b00dc050e")!) {
            data, response, err in
            guard let respData = data else { completion([]); return }
            do {
                let responseDict = try JSONSerialization.jsonObject(with: respData, options: .mutableLeaves)
                guard let responseArr = responseDict as? [[String:Any]] else {
                    completion([])
                    return
                }
                completion(responseArr)
            }
            catch {
                completion([])
                print(error.localizedDescription)
            }
        }.resume()
    }
}
