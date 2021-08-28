//
//  SettingsViewController.swift
//  Checkers
//
//  Created by Александра  Значёнок on 26.07.21.
//

import UIKit

class SettingsViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func menuButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        present(getViewController(from: "AboutViewController"), animated: true, completion: nil)
        
    
    

    }
     
    func getViewController(from id: String) -> UIViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let curentViewController = storybord.instantiateViewController(withIdentifier: id)
        curentViewController.modalPresentationStyle = .fullScreen
        curentViewController.modalTransitionStyle = .crossDissolve
        return curentViewController
        
   
}
    }
