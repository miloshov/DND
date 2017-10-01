//
//  CallUsFile.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import Foundation
import UIKit

// Custom file made for enabeling calls directly from application

@available(iOS 10.0, *)
func callNumber(phoneNumber: String) {
    
    if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        
        let application: UIApplication = UIApplication.shared
        
        if (application.canOpenURL(phoneCallURL)) {
            
            application.open(phoneCallURL, options: [:], completionHandler: nil)
            
        }
        
    }
    
}
