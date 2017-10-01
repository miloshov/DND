//
//  ContactVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {
    
    // MARK: Properties
    
    
    @IBAction func CallUsBtnPressed(_ sender: UIButton) {

            callNumber(phoneNumber: "+381113196706")
        
    }
    
    @IBAction func AskUsBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toSendQuestionVC", sender: ContactVC())
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

