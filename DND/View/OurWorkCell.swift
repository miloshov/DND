//
//  OurWorkCell.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class OurWorkCell: UITableViewCell {
    
    //MARK:Properties
    
    @IBOutlet weak var ourWorkImage: UIImageView!
    @IBOutlet weak var ourWorkTitleLbl: UILabel!
    @IBOutlet weak var ourWorkSubtitleLbl: UILabel!
    
    
    func configureCell (work: OurWorkFile) {
        
        ourWorkTitleLbl.text = work.name
        ourWorkSubtitleLbl.text = work.details
        downloadImage(work.image)
    }
    
    func downloadImage(_ stringURL: String) {
        
        Alamofire.request(stringURL).responseImage { (response) in
            if let image = response.result.value {
                DispatchQueue.main.async { [unowned self] in
                    self.ourWorkImage.image = image
                }
            } else { // Can't Find legit image, use earth surface
                let url = URL(string: "http://www.visitcolumbiamo.com/wp-content/themes/COMO/img/photo-unavailable.jpg")!
                DispatchQueue.global(qos: .background).async {
                    
                    do {
                        
                        let data = try Data(contentsOf: url)
                        DispatchQueue.main.async {
                            self.ourWorkImage.image = UIImage(data: data)
                        }
                        
                    } catch {
                        //handle the error
                        
                    }
                }
                
            }
        }
        
    }
    
}
