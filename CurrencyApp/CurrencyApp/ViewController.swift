//
//  ViewController.swift
//  CurrencyApp
//
//  Created by Sezil Akdoğan on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gosterTiklandi(_ sender: Any) {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
                
            let session = URLSession.shared
                
                
                
            let task = session.dataTask(with: url!) { (data, response, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                        alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                } else {
                        
                    if data != nil {
                        do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                
                                
                            DispatchQueue.main.async {
                                if let rates = jsonResponse["rates"] as? [String : Any] {
        
                                        
                                    if let gbp = rates["GBP"] as? Double {
                                        self.gbpLabel.text = "GBP: \(gbp)"
                                    }
                                        
                                    if let usd = rates["USD"] as? Double {
                                        self.usdLabel.text = "USD: \(usd)"
                                    }
                                        
                                    if let turkish = rates["TRY"] as? Double {
                                        self.tryLabel.text = "TRY: \(turkish)"
                                    }
                                        
                                        
                                }
                            }
                                
                                
                        } catch {
                            print("error")
                        }
                            
                    }
                        
                        
                }
            }
                
            task.resume()
                
                
        }
            
    
}

