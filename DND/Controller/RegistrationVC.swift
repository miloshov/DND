//
//  RegistrationVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit
import MessageUI

class RegistrationVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var facilityTextField: UITextField!
    @IBOutlet weak var licenceTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func sendBtnPressed(_ sender: UIButton) {
        
        if nameTextField.hasText && surnameTextField.hasText && facilityTextField.hasText && licenceTextField.hasText && phoneTextField.hasText && emailTextField.hasText {
            
            let mailComposeViewController = configuredMailComposeViewController()
            
            if MFMailComposeViewController.canSendMail() {
                
                self.present(mailComposeViewController, animated: true, completion: nil)
                
            }
            
        } else {
            
            UnseccessfullAlert()
        }
        
    }
    
    func UnseccessfullAlert() {
        
        let fieldAlert: UIAlertController = UIAlertController(title: "Greška", message: "Morate da popunite sva polja. Hvala.", preferredStyle: UIAlertControllerStyle.alert)
        let okBtn = UIAlertAction(title: "U Redu", style: .default, handler: nil)
        
        fieldAlert.addAction(okBtn)
        
        self.present(fieldAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["info@dndcommerce.rs"])
        mailComposerVC.setSubject("\(String(describing: nameTextField.text!)) \(String(describing: surnameTextField.text!)) se prijavljuje za edukaciju")
        mailComposerVC.setMessageBody("Ime i Prezime: \(nameTextField.text!) \(surnameTextField.text!)\n Ime Ustanove: \(facilityTextField.text!)\n Broj Licence: \(licenceTextField.text!)\n Broj Telefona: \(phoneTextField.text!)\n E-mail Adresa: \(emailTextField.text!)", isHTML: false)
        
        return mailComposerVC
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
}

