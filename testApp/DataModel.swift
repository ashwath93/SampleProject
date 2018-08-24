//
//  DataModel.swift
//  testApp
//
//  Created by Turvo on 24/08/18.
//  Copyright © 2018 Turvo. All rights reserved.
//

import UIKit
import MapKit

class DataModel: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    var address : String = ""
    var lat : CGFloat = 0.0
    var lng : CGFloat = 0.0
    var image : String = ""
    
    init(params: [String:Any]) {
        if let name1 = params["name"] as? String {
            title = name1
        }
        if let name1 = params["address"] as? String {
            address = name1
        }
        if let name1 = params["lat"] as? CGFloat, let name2 = params["lng"] as? CGFloat {
            lat = name1
            lng = name2
        }
        if let name1 = params["image"] as? String {
            image = name1
        }
        coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lng))
        super.init()
    }
}
