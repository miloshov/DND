//
//  NewsCell.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class NewsCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsSubtitleLbl: UILabel!
    
    
    func configureCell (news: NewsFile) {
        
        newsTitleLbl.text = news.name
        newsSubtitleLbl.text = news.details
        downloadImage(news.image)
        
    }
    
    func downloadImage(_ stringURL: String  ) {
        
        Alamofire.request(stringURL).responseImage { (response) in
            
            if let image = response.result.value {
                
                DispatchQueue.main.async { [unowned self] in
                    
                    self.newsImageView.image = image
                }
                
            } else {
                
                let url = URL(string: "http://www.visitcolumbiamo.com/wp-content/themes/COMO/img/photo-unavailable.jpg")!
                DispatchQueue.global(qos: .background).async {
                    
                    do {
                        
                        let data = try Data(contentsOf: url)
                        DispatchQueue.main.async {
                            
                            self.newsImageView.image = UIImage(data: data)
                            
                        }
                        
                    } catch {
                        
                        // handle error
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}
