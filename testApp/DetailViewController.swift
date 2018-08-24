//
//  DetailViewController.swift
//  testApp
//
//  Created by Turvo on 24/08/18.
//  Copyright © 2018 Turvo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var dataModel : DataModel?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MapPresenter.fetchImage(url: dataModel?.image ?? "") { (image) in
            DispatchQueue.main.async {
                self.imgView.image = image
            }
        }
        self.nameLabel.text = dataModel?.title
        self.detailLabel.text = dataModel?.address
    }
}
