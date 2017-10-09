//
//  AboutUsVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class AboutUsVC: UIViewController {
    
    // MARK: Properties
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func CallUsBtnPressed(_ sender: UIButton) {
        
        if #available(iOS 10.0, *) {
            callNumber(phoneNumber: "+381113196706")
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
