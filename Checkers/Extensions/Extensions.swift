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
