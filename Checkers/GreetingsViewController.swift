//
//  GreetingsViewController.swift
//  Checkers
//
//  Created by Александра  Значёнок on 26.07.21.
//

import UIKit

class GreetingsViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    var countTickMin: Int = 0
    var countTickSec: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    var currentDirection: DirectionCheckers = .rick

    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

//    var checkersPosition: Checker = Checker()
    

    
    func getViewController(from id: String) -> UIViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let curentViewController = storybord.instantiateViewController(withIdentifier: id)
        curentViewController.modalPresentationStyle = .fullScreen
        curentViewController.modalTransitionStyle = .crossDissolve
        return curentViewController
    }
//    func getPositionCheckers() { // достаю сохранённое из файла
//        let fileURL = documentDirectory.appendingPathComponent("checkersPosition")
//        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
//        guard let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: Checkers.self, from: data) else { return }
//        self.checkersPosition = object }

    func applyDataFromUSerDefaults() { // применяю сохранённый таймер
        let userDefaults = UserDefaults.standard
        self.countTickMin = userDefaults.integer(forKey: "countTickMin_")
        self.countTickSec = userDefaults.integer(forKey: "countTickSec_")
//        let minutes = (userDefaults.integer(forKey: KeysUserDefaults.countTickMin.rawValue))
//        self.countTickMin = minutes
//        let seconds = (userDefaults.integer(forKey: KeysUserDefaults.countTickSec.rawValue))
//        self.countTickSec = seconds
        
    }
    
    @IBAction func ResultButton(_sender: UIButton) {
      present(getViewController(from: "ResultViewController"), animated: true, completion: nil)
    }
    @IBAction func SettingsButton(_sender: UIButton) {
      present(getViewController(from: "SettingsViewController"), animated: true, completion: nil)
    }


    @IBAction func PlayButton(_sender: UIButton) {
        presentAlertController(with: "", message: "Start a new game?", preferredStyle: .alert, actions: UIAlertAction(title: "YES", style: .default, handler: { _ in
            
            self.present(self.getViewController(from: "NameOfPlayerViewController"), animated: true, completion: nil)}),
                               
            UIAlertAction(title: "Continue", style: .default, handler: { _ in
                self.present(self.getViewController(from: "GameViewController"), animated: true, completion: nil)
                self.applyDataFromUSerDefaults()
//                self.getPositionCheckers()
            }),
 
            UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                self.navigationController?.popViewController(animated: true)
//        self.present(self.getViewController(from: "GreetingsViewController"), animated: true, completion: nil)
            } ))
        
}

}


//
//    @IBAction func violetButtonAction(_ sender: UIButton) {
//        present(getViewController(from: "VioletViewController"), animated: true, completion: nil)
//    }
//
//    @IBAction func blueButtonAction(_ sender: UIButton) {
//        self.navigationController?.pushViewController(getViewController(from: "BlueViewController"), animated: true)
//
//

