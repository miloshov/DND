//
//  HawoVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/9/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class HawoVC: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textView: UITextView!

    @IBAction func backBtnPressed (_sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.isEditable = false
    }

}
