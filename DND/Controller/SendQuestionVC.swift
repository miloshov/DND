//
//  SendQuestionVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit
import MessageUI

class SendQuestionVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func SendBtnPressed(_ sender: UIButton) { // Need to implement successfull alert someware...
        
        if fullNameTextField.hasText && questionTextView.hasText{
            
            let mailComposeViewController = configuredMailComposeViewController()
            
            if MFMailComposeViewController.canSendMail() {
                
                self.present(mailComposeViewController, animated: true, completion: nil)
                
            }
            
        } else {
            
            UnseccessfullAlert()
        }
    }
    
    func SuccessfullAlert() {
        
        let fieldAlert: UIAlertController = UIAlertController(title: "Uspešno Poslato", message: "Vaše pitanje je uspešno poslato. Hvala Vam na iteresovanju.", preferredStyle: UIAlertControllerStyle.alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        fieldAlert.addAction(okBtn)
        
        self.present(fieldAlert, animated: true, completion: nil)
    }
    
    
    func UnseccessfullAlert() {
        
        let fieldAlert: UIAlertController = UIAlertController(title: "Greška", message: "Morate da popunite sva polja. Hvala.", preferredStyle: UIAlertControllerStyle.alert)
        let okBtn = UIAlertAction(title: "U Redu", style: .default, handler: nil)
        
        fieldAlert.addAction(okBtn)
        
        self.present(fieldAlert, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["info@dndcommerce.rs"])
        mailComposerVC.setSubject("\(String(describing: fullNameTextField.text!)) želi da vam postavi pitanje")
        mailComposerVC.setMessageBody(questionTextView.text, isHTML: false)
        
        return mailComposerVC
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
}
