//
//  NameOfPlayerViewController.swift
//  Checkers
//
//  Created by Александра  Значёнок on 8.11.21.
//

import UIKit

class NameOfPlayerViewController: UIViewController {

    @IBOutlet weak var VSImage: UIImageView!
    @IBOutlet weak var Player2: UITextField!
    @IBOutlet weak var Player1: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func ConfirmButton(_ sender: UIButton) {
        guard !Player1.text!.isEmpty, !Player2.text!.isEmpty else {
            ErrorLabel.text = "Please enter your names"
            ErrorLabel.textColor = .red
            return
        }
//        SaveData.saveNameOfPlayer(nameOfPlayer1: Player1.text!, nameOfPlayer2: Player2.text!)
        
        present(getViewController(from: "GameViewController"), animated: true, completion: nil)

    }

}
