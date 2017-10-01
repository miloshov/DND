//
//  OurPartnersVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class OurPartnersVC: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var collection: UICollectionView!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
