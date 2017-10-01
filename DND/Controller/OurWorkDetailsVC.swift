//
//  OurWorkDetailsVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit
import Alamofire

class OurWorkDetailsVC: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var textLbl: UITextView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var imageLbl: UIImageView!
    @IBOutlet weak var latitudeLbl: UILabel!
    @IBOutlet weak var longitudeLbl: UILabel!
    
    var work: OurWorkFile!
    
    // MARK: Back Button dismiss configured
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: Share Button configured
    
    @IBAction func shareBtnPressed(_ sender: UIButton) {
        
        let shareButton = UIActivityViewController(activityItems: [imageLbl.image as Any, textLbl.text!], applicationActivities: nil)
        
        shareButton.popoverPresentationController?.sourceView = self.view
        
        self.present(shareButton, animated: true, completion: nil)
        
    }
    
    @IBAction func LocationPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLocationVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLocationVC" {
            let vc = segue.destination as? LocationVC
            vc?.Work = self.work
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latitudeLbl.isHidden = true
        longitudeLbl.isHidden = true
        textLbl.isEditable = false
        
        titleLbl.text = work.name
        dateLbl.text = work.date
        textLbl.text = work.details
        addressLbl.text = work.address
        cityLbl.text = work.city
        latitudeLbl.text = work.lat
        longitudeLbl.text = work.lon
        downloadImage(work.image)
        
    }
    
    func downloadImage(_ stringURL: String  ) {
        
        let url = URL(string: stringURL)!
        
        DispatchQueue.global().async { [unowned self] in
            
            do {
                
                let data = try Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    
                    self.imageLbl.image = UIImage(data: data)
                    self.imageLbl.isHidden = false
                    
                }
            } catch {
                
                // handle error here
                
            }
        }
    }
    
}

