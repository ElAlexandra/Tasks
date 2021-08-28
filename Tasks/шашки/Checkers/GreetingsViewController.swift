//
//  GreetingsViewController.swift
//  Checkers
//
//  Created by Александра  Значёнок on 26.07.21.
//

import UIKit

class GreetingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func getViewController(from id: String) -> UIViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let curentViewController = storybord.instantiateViewController(withIdentifier: id)
        curentViewController.modalPresentationStyle = .fullScreen
        curentViewController.modalTransitionStyle = .crossDissolve
        return curentViewController
    }
    
    
      @IBAction func PlayButton(_sender: UIButton) {
        
        present(getViewController(from: "GameViewController"), animated: true, completion: nil)

          
      }
      @IBAction func ResultButton(_sender: UIButton) {
        present(getViewController(from: "ResultViewController"), animated: true, completion: nil)
      }
      @IBAction func SettingsButton(_sender: UIButton) {
        present(getViewController(from: "SettingsViewController"), animated: true, completion: nil)
      }

//    func getViewController(from id: String) -> UIViewController {
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        let curentViewController = storybord.instantiateViewController(withIdentifier: id)
//        curentViewController.modalPresentationStyle = .fullScreen
//        curentViewController.modalTransitionStyle = .crossDissolve
//        return curentViewController
//    }
//
//    @IBAction func violetButtonAction(_ sender: UIButton) {
//        present(getViewController(from: "VioletViewController"), animated: true, completion: nil)
//    }
//
//    @IBAction func blueButtonAction(_ sender: UIButton) {
//        self.navigationController?.pushViewController(getViewController(from: "BlueViewController"), animated: true)
//
//

}
