//
//  PartnersFile.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import Foundation
import UIKit

class PartnersFile {
    
    //MARK: Properties
    
    var _photo: UIImage?
    var _title: String!
    var _subtitle: String!
    
    
    
    var photo: UIImage? {
        
        return _photo
    }
    
    var title: String {
        
        return _title
    }
    
    var subtitile: String {
        
        return _subtitle
    }
    
    
    //MARK: Initialization
    
    init? (title: String, subtitle: String, photo: UIImage?) {
        
        _photo = photo
        _title = title
        _subtitle = subtitle
    }
    
}
