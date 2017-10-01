//
//  NewsDetailsVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit
import Alamofire

class NewsDetailsVC: UIViewController {
    
    // MARK: Porperties
    
    @IBOutlet weak var imageLbl: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textLbl: UITextView!
    
    var news: NewsFile!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func shareBtnPressed(_ sender: UIButton) {
        
        let shareButton = UIActivityViewController(activityItems: [imageLbl.image!, textLbl.text!], applicationActivities: nil)
        
        shareButton.popoverPresentationController?.sourceView = self.view
        
        self.present(shareButton, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLbl.isHidden = true
        textLbl.isEditable = false
        
        titleLbl.text = news.name
        textLbl.text = news.details
        downloadImage(news.image)
        
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

