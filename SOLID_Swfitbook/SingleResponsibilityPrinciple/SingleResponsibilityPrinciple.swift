//
//  ViewController.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 18.03.2022.
//

import UIKit

struct Country: Decodable {
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}

class SingleResponsibilityPrinciple: UIViewController {

    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    var networkServie = NetworkService()
    var dataStore = DataStore()
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkServie.dataFetcher(urlString: urlString)
    }
    
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return }
        
        dataStore.saveNameInCache(name: name)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Yout name can't be empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeLabel(_ sender: UITextField) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func sabeButtonTapped(_ sender: UIButton) {
        changeName()
    }
}

