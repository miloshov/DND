//
//  OurWorkFile.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import Foundation
import Alamofire

class OurWorkFile {
    
    private var _name: String!
    private var _date: String!
    private var _details: String!
    private var _address: String!
    private var _city: String!
    private var _lat: String!
    private var _lon: String!
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
        
//        let dateFormattor = DateFormatter()
//        dateFormattor.dateStyle = .full
//        dateFormattor.timeStyle = .none
//        let currentDate = dateFormattor.string(from: Date())
//        self._date = currentDate
        
        return _date
        
    }
    
    var details: String {
        
        if _details == nil {
            
            _details = ""
            
        }
        
        return _details
        
    }
    
    var address: String {
        
        if _address == nil {
            
            _address = ""
            
        }
        
        return _address
        
    }
    
    var city: String {
        
        if _city == nil {
            
            _city = ""
            
        }
        
        return _city
        
    }
    
    var lat: String {
        
        if _lat == nil {
            
            _lat = ""
            
        }
        
        return _lat
        
    }
    
    var lon: String {
        
        if _lon == nil {
            
            _lon = ""
            
        }
        
        return _lon
        
    }
    
    var image: String {
        
        if _image == nil {
            
            _image = ""
            
        }
        
        return _image
        
    }
    
    init (ourWorkDict: Dictionary<String, AnyObject>) {
        
        if let newName = ourWorkDict["name"] as? String {
            
            self._name = newName
            
        }
        
        if let newDetails = ourWorkDict["details"] as? String {
            
            self._details = newDetails
            
        }
        
        if let newImage = ourWorkDict["image"] as? String {
            
            self._image = newImage
            
        }
        
        if let newDate = ourWorkDict["date"] as? String {
            
            self._date = newDate
            
        }
        
        if let newAddress = ourWorkDict["address"] as? String {
            
            self._address = newAddress
            
        }
        
        if let newCity = ourWorkDict["city"] as? String {
            
            self._city = newCity
            
        }
        
        if let newLat = ourWorkDict["lat"] as? String {
            
            self._lat = newLat
            
        }
        
        if let newLon = ourWorkDict["lon"] as? String {
            
            self._lon = newLon
            
        }
    }
}
