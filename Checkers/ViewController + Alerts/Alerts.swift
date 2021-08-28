//
//  Alerts.swift
//  Checkers
//
//  Created by Александра  Значёнок on 11.08.21.
//

import UIKit

extension UIViewController {
    @discardableResult
//    -  чтобы убрать варнинг (вы не используете возвращаемое значение) значит, что я могу не использовать возвращаемое значение
    func presentAlertController(with title: String?, message: String?, preferredStyle: UIAlertController.Style, actions: UIAlertAction...) -> UIAlertController {
        
    let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
////        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
////        let save = UIAlertAction(title: "YES", style: .cancel, handler: {_ in })
////        let no = UIAlertAction(title: "NO", style: .default, handler: {_ in })
        actions.forEach { alert.addAction($0) }
////        alert.addAction(save)
////        alert.addAction(no)
////        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        return alert
        
        
//    let alertAbout = UIAlertController(title: "About", message: "When a man reaches the kings row (also called crownhead, the farthest row forward), it becomes a king, and marked by placing an additional piece on top of the first man (crowned), and acquires additional powers including the ability to move backwards and,", preferredStyle: .alert)
    
//    let close = UIAlertAction(title: "Close", style: .destructive, handler: nil)
//    alertAbout.addAction(close)
    
    
}
}
