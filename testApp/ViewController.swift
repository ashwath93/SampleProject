//
//  ViewController.swift
//  testApp
//
//  Created by Turvo on 24/08/18.
//  Copyright © 2018 Turvo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var selectedModel : DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        fetchData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func fetchData() {
        MapPresenter.fetchData {
            mapModel in
            DispatchQueue.main.async {
                self.mapView.addAnnotations(mapModel)
                self.mapView.showAnnotations(mapModel, animated: true)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.dataModel = selectedModel
    }
}
