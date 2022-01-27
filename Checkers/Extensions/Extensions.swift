//
//  Extensions.swift
//  Checkers
//
//  Created by Александра  Значёнок on 20.08.21.
//

import UIKit

extension GameViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool { // чтобы можно было применить несколько жество к одному объекту используем этот делегат
        return true
    }
}

extension GameViewController {
func getViewController(from id: String) -> UIViewController {
    let storybord = UIStoryboard(name: "Main", bundle: nil)
    let curentViewController = storybord.instantiateViewController(withIdentifier: id)
    curentViewController.modalPresentationStyle = .fullScreen
    curentViewController.modalTransitionStyle = .crossDissolve
    return curentViewController
}
}

extension SettingsViewController {
    func getViewController(from id: String) -> UIViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let curentViewController = storybord.instantiateViewController(withIdentifier: id)
        curentViewController.modalPresentationStyle = .fullScreen
        curentViewController.modalTransitionStyle = .crossDissolve
        return curentViewController
    }
}

extension NameOfPlayerViewController {
    func getViewController(from id: String) -> UIViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let curentViewController = storybord.instantiateViewController(withIdentifier: id)
        curentViewController.modalPresentationStyle = .fullScreen
        curentViewController.modalTransitionStyle = .crossDissolve
        return curentViewController
    }
}
