//
//  OpenClosedPrinciple.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 18.03.2022.
//

import UIKit

class OpenClosedPrinciple: UIViewController {
    
//    var networkServie = NetworkService2()
    var dataFetcherService = DataFetcherService()
    var dataStore = DataStore2()
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        networkDataFetcher.fetchCountry(urlString: countryUrlString) { countries in
//            print(countries?.first?.Name)
//        }
        
//        networkDataFetcher.fetchGames(urlString: appsUrlString) { apps in
//            print(apps)
//        }
        
        dataFetcherService.fetchCountry { countries in
            print(countries?.first?.Name)
        }
        
        dataFetcherService.fetchGames { game in
            print(game?.feed.results.first?.name)
        }
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
