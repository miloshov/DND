//
//  PrintexVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/7/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class PrintexVC: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var linkView: UITextView!

    
    @IBAction func backBtnPressed (_sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        linkView.isEditable = false
        linkView.dataDetectorTypes = .link
        textView.isEditable = false
    }

}
