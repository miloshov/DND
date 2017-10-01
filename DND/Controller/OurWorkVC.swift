//
//  OurWorkVC.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class NewOurWorkTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var allOurWork = [OurWorkFile]()
    var ourWork: OurWorkFile!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isHidden = true
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadOurWorkData {
            
            self.downloadOurWorkImage()
        }
        
        // loadDataTest()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Reachability.shared.isConnectedToNetwork() {
            
            print("Connected")
        } else {
            
            UnseccessfullAlert()
        }
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allOurWork.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ourWorkCellIdentifier = "OurWorkCell"
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ourWorkCellIdentifier, for: indexPath) as? OurWorkCell {
            
            let forOurWork = allOurWork[indexPath.row]
            
            cell.configureCell(work: forOurWork)
            
            self.tableView.isHidden = false
            
            return cell
            
        } else {
            
            return OurWorkCell()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let work = allOurWork[indexPath.row]
        
        performSegue(withIdentifier: "toOurWorkDetailsVC", sender: work)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toOurWorkDetailsVC" {
            
            if let detailsVC = segue.destination as? OurWorkDetailsVC {
                
                if let work = sender as? OurWorkFile {
                    
                    detailsVC.work = work
                }
            }
        }
    }
    
    
    func downloadOurWorkData (completed: @escaping DownloadComplete) {
        
        Alamofire.request(ALL_EDUCATION_URL).responseJSON { (response) in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let dictList = dict["Educations"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in dictList {
                        
                        let ourWork = OurWorkFile(ourWorkDict: obj)
                        
                        self.allOurWork.append(ourWork)
                        
                    }
                    
                    self.tableView.reloadData()
                    
                }
                
            }
            
            completed()
        }
        
        
    }
    
    func downloadOurWorkImage () {
        
        Alamofire.request("https://httpbin.org/image/png").responseImage { response in
            debugPrint(response)
            debugPrint(response.result)
            
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
            }
            
        }
        
    }
    
    func UnseccessfullAlert() {
        
        let fieldAlert: UIAlertController = UIAlertController(title: "Internet Nije Dostupan", message: "Ovaj odeljak zahteva pristup internetu. Molimo Vas da obezbedite neki oblik konekcije (WiFi, GSM) kako bi se ucitao željeni sadržaj.\n Hvala, Vaš DND.", preferredStyle: UIAlertControllerStyle.alert)
        let okBtn = UIAlertAction(title: "U Redu", style: .default, handler: nil)
        
        fieldAlert.addAction(okBtn)
        
        self.present(fieldAlert, animated: true, completion: nil)
    }
    
    
    
}

