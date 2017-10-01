//
//  NewsFile.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import Foundation
import Alamofire

class NewsFile {
    
    private var _name: String!
    private var _date: String!
    private var _details: String!
    private var _image: String!
    
    var name: String {
        
        if _name == nil {
            
            _name = ""
            
        }
        
        return _name
        
    }
    
    var date: String {
        
        if _date == nil {
            
            _date = ""
            
        }
        
        return _date
        
    }
    
    var details: String {
        
        if _details == nil {
            
            _details = ""
            
        }
        
        return _details
        
    }
    
    var image: String {
        
        if _image == nil {
            
            _image = ""
            
        }
        
        return _image
        
    }
    
    init(ourNewsDict: Dictionary<String, AnyObject>) {
        
        if let newName = ourNewsDict["name"] as? String {
            
            self._name = newName
            
        }
        
        if let newDate = ourNewsDict["date"] as? String {
            
            self._date = newDate
            
        }
        
        if let newDetails = ourNewsDict["details"] as? String {
            
            self._details = newDetails
            
        }
        
        if let newImage = ourNewsDict["image"] as? String {
            
            self._image = newImage
            
        }
        
    }
    
    
    
}
