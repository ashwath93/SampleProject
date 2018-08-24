//
//  MapPresenter.swift
//  testApp
//
//  Created by Turvo on 24/08/18.
//  Copyright © 2018 Turvo. All rights reserved.
//

import UIKit

class MapPresenter {
    
    class func fetchData(completion: @escaping (([DataModel]) -> ())) {
        NetworkLayer.makeAPICall {
            responseArr in
            guard let respArr = responseArr as? [[String:Any]] else { return }
            var dataModel = [DataModel]()
            respArr.forEach {
                let model = DataModel(params: $0)
                dataModel.append(model)
            }
            completion(dataModel)
        }
    }
    
    class func fetchImage(url: String, completion: @escaping ((UIImage?) -> ())) {
        DispatchQueue.global().async {
            do {
                let data = try Data.init(contentsOf: URL(string: url)!)
                completion(UIImage(data: data))
            }
            catch {
                print(error.localizedDescription)
            }
        }

    }
}
