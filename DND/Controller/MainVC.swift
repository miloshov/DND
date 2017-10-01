//
//  MainVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: Properties
    
    @IBAction func callUsBtnPressed(_sender: UIButton) {
        
        callNumber(phoneNumber: "+381113196706")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
