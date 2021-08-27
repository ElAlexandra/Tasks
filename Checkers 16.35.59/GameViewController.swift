//
//  GameViewController.swift
//  Checkers
//
//  Created by Александра  Значёнок on 27.07.21.
//

import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    public func gestuRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithotherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
class GameViewController: UIViewController {
    enum DirectionCheckers: Int {
        case rick = 0
        case morty = 1
    }
    
    
    
    var chessboard: UIView!
    var timer: Timer?
    var countTickSec: Int = 0
    var countTickMin: Int = 0
    var checkerImage: UIImageView!
    var currentDirection: DirectionCheckers = .rick
    var isLongPress: Bool = false
  
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        

        view.backgroundColor = .black
        createChessboard()
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        timerLabel.backgroundColor = .white
        
    }
   
    
    
    @IBAction func backButton(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        dismiss(animated: true, completion: nil)
    }
    
    @objc func timerCount() {
        if countTickSec >= 59 {
            countTickMin += 1
            countTickSec = 1
        }
        countTickSec += 1
        timerLabel.text = "\(countTickMin):\(countTickSec)"
    }
    
    
    func createChessboard() {
        chessboard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 320)))
        chessboard.backgroundColor = .white
        
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ? .white : .black
                chessboard.addSubview(column)
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                checkerImage = UIImageView(frame: CGRect(x: 5.0, y: 5.0, width: 30, height: 30))
                checkerImage.image = UIImage(named: j < 3 ? "рик2" : "морти")
                checkerImage.layer.cornerRadius = checkerImage.frame.height / 2.0
                checkerImage.clipsToBounds = true
                checkerImage.isUserInteractionEnabled = true
                column.addSubview(checkerImage)

                let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
                longPressGesture.minimumPressDuration = 0.1
                longPressGesture.delegate = self
                checkerImage.addGestureRecognizer(longPressGesture)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                panGesture.delegate = self
                checkerImage.addGestureRecognizer(panGesture)
                
            }
        }
        
        view.addSubview(chessboard)
        chessboard.center = view.center
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        guard let checkers = sender.view else { return }
//        isLongPress = true
        switch sender.state {
        case .began:
            UIImageView.animate(withDuration: 0.3) {
                checkers.transform = checkers.transform.scaledBy(x: 1.3, y: 1.3)
            }
        case .ended:
            UIImageView.animate(withDuration: 0.3) {
                checkers.transform = .identity
            }
        default:
            break
            
        }
        
        
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
    
        guard let checker = sender.view, checker.tag == currentDirection.rawValue else { return }
        
        let location = sender.location(in: chessboard)
        let translation = sender.translation(in: chessboard)

        switch sender.state {
        case .changed:
            guard let column = sender.view?.superview, let cellOrigin = sender.view?.frame.origin else { return }
            chessboard.bringSubviewToFront(column)
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                y: cellOrigin.y + translation.y)

            sender.setTranslation(.zero, in: chessboard)
        case .ended:
            UIImageView.animate(withDuration: 0.3) {
                sender.view?.transform = .identity
            }
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.backgroundColor == .black })

            sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else { return }
           

            currentCell?.addSubview(cell)
            
            print (panGesture)
            
            currentDirection = currentDirection == .rick ? .morty : .rick
            
        default: break
        }
   }


}
