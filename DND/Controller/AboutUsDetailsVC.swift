//
//  AboutUsDetailsVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class AboutUsDetailsVC: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var imageLbl: UIImageView!
    @IBOutlet weak var textLbl: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func shareBtnPressed(_ sender: UIButton) {
        
        // This is sharing only image on FB and only text on WA. Should be checked why?
        
        let shareButton = UIActivityViewController(activityItems: [imageLbl.image as Any, textLbl.text!], applicationActivities: nil)
        
        shareButton.popoverPresentationController?.sourceView = self.view
        
        self.present(shareButton, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLbl.isEditable = false
    }
    
}
