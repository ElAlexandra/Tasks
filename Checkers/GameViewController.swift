//
//  GameViewController.swift
//  Checkers
//
//  Created by Александра  Значёнок on 27.07.21.
//

import UIKit

enum DirectionCheckers: Int {
    case rick = 0
    case morty = 1
}

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var TimerView: UIView!
    @IBOutlet weak var ButtonView: UIView!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var actualyChecker: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    var checkerTag: Int = 0
    var cellTag: Int = 0
    
    var chessboard: UIView!
    var stopButtonTimer: Bool = false
    var timer: Timer?
    var countTickMin: Int = 0
    var countTickSec: Int = 0
    var checkerImage: UIImageView!
    var currentDirection: DirectionCheckers = .rick
    
    var checkersPosition: Checkers = Checkers()

    override func viewDidLoad() { 
        super.viewDidLoad()
    
//        view.backgroundColor = .black
        createChessboard()
        setUpTimer()
        view.addSubview(setBackground())
    }
    
    func setUpTimer() {
    timer = Timer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    RunLoop.main.add(timer!, forMode: .common)
    timerLabel.text = "0\(countTickMin) : 0\(countTickSec)"
    }
    
    func createChessboard() {
        chessboard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 320)))
        chessboard.backgroundColor = .white
        
    
        TimerView.layer.borderWidth = 3
        TimerView.layer.borderColor = CGColor(red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 40 / 255)
        TimerView.layer.cornerRadius = TimerView.frame.height / 2.0
        TimerView.clipsToBounds = true
        
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ? .white : .black
                cellTag += 1
                column.tag = cellTag // задаём тег клетке
               
                chessboard.addSubview(column)
                
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                checkerImage = UIImageView(frame: CGRect(x: 5.0, y: 5.0, width: 30, height: 30))
                checkerImage.image = UIImage(named: j < 3 ? "рик2" : "морти")
                checkerTag += 1
                checkerImage.tag = checkerTag // задём тэг шашке, так как изначально у неё нет тэга
                checkerImage.layer.cornerRadius = checkerImage.frame.height / 2.0
                checkerImage.clipsToBounds = true
                checkerImage.isUserInteractionEnabled = true
                
                checkerImage.tag = j < 3 ? 0 : 1
                
                column.addSubview(checkerImage)
                
                let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
                longPressGesture.minimumPressDuration = 0.1
                longPressGesture.delegate = self
                checkerImage.addGestureRecognizer(longPressGesture)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                panGesture.delegate = self
                checkerImage.addGestureRecognizer(panGesture) } }
        chessboard.layer.borderWidth = 5
        chessboard.layer.borderColor = CGColor(red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)
        view.addSubview(chessboard)
        chessboard.center = view.center }
    
    @objc func timerCount() {
        countTickSec += 1
        
        if countTickSec == 60 {
            countTickMin += 1
            countTickSec = 0
        }
        
        let sec = countTickSec < 10 ? ":0\(countTickSec)" : " : \(countTickSec)"
        let min = countTickMin < 10 ? " 0\(countTickMin)" : " : \(countTickMin)"
    
        timerLabel.text = min + sec
        timerLabel.backgroundColor = .white

    }

    
    
    func saveDataToUserDefaults() { // сохраняю таймер
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(countTickSec, forKey: "countTickSec_")
        userDefaults.setValue(countTickMin, forKey: "countTickMin_") }
//        userDefaults.setValue(self.timerLabel.text, forKey: KeysUserDefaults.countTickSec.rawValue)
//        userDefaults.setValue(self.timerLabel.text, forKey: KeysUserDefaults.countTickMin.rawValue)

    func applyDataFromUSerDefaults() { // применяю сохранённый таймер
        let userDefaults = UserDefaults.standard
//        let minutes = (userDefaults.integer(forKey: KeysUserDefaults.countTickMin.rawValue))
//        self.countTickMin = minutes
//        let seconds = (userDefaults.integer(forKey: KeysUserDefaults.countTickSec.rawValue))
//        self.countTickSec = seconds
        self.countTickMin = userDefaults.integer(forKey: "countTickMin_")
        self.countTickSec = userDefaults.integer(forKey: "countTickSec_")
    }
//        self.timerLabel.text = userDefaults.string(forKey: KeysUserDefaults.countTickMin.rawValue)
//        self.timerLabel.text = userDefaults.string(forKey: KeysUserDefaults.countTickSec.rawValue) }
        
        func removeDataFromUserDefaults() {
            let userDefaults = UserDefaults.standard
            userDefaults.removeObject(forKey: "countTickSec_")
            userDefaults.removeObject(forKey: "countTickMin_")
        }
    
    func savePositionCheckers() { // сохраняю данные в файл
        let data = try? NSKeyedArchiver.archivedData(withRootObject: checkersPosition, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent("checkersPosition")
        try? data?.write(to: fileURL)
        }
    
    func getPositionCheckers() { // достаю сохранённое из файла
        let fileURL = documentDirectory.appendingPathComponent("checkersPosition")
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
        guard let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: Checkers.self, from: data) else { return }
        self.checkersPosition = object
    }
    
    func setBackground() -> UIView {
        let backgroungImage = UIImageView(image: UIImage(named: "ФОН8"))
        let backgroungImageSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        backgroungImage.frame = CGRect(origin: .zero, size: backgroungImageSize)
        backgroungImage.layer.zPosition = -1
        return backgroungImage
    }
    
//    func checkSaveFile() {
//        if FileManager().fileExists(atPath: URL.saveGameURL().path) {
//            applyDataFromUSerDefaults()
//            getPositionCheckers()
//            createChessboard()
//
//            removeDataFromUserDefaults()
//            Checkers.removeAll()
//        } else {
//            createChessboard()
//        }
//    }
    
    func getViewController(from id: String) -> UIViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let curentViewController = storybord.instantiateViewController(withIdentifier: id)
        curentViewController.modalPresentationStyle = .fullScreen
        curentViewController.modalTransitionStyle = .crossDissolve
        return curentViewController
    }
    
  
    
    @IBAction func stopButton(_ sender: UIButton) {
        presentAlertController(with: "Think about it!" , message: "Do you want save this game?", preferredStyle: .alert, actions: UIAlertAction(title: "YES", style: .default, handler: { _ in
        self.present(self.getViewController(from: "GreetingsViewController"), animated: true, completion: nil)
            self.saveDataToUserDefaults()
            self.savePositionCheckers()
            self.navigationController?.popViewController(animated: true)
            }),
        UIAlertAction(title: "NO", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        } ))
//        timer?.invalidate()
//        timer = nil
        
    }
    
    
   
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        guard let checkers = sender.view else { return }
        switch sender.state {
        case .began:
            UIImageView.animate(withDuration: 0.3) {
                checkers.transform = checkers.transform.scaledBy(x: 1.3, y: 1.3) }
        case .ended:
            UIImageView.animate(withDuration: 0.3) {
                checkers.transform = .identity }
        default:
            break } }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        guard let checker = sender.view, checker.tag == currentDirection.rawValue else { return } // сможем ходить только шашкой которая является currentDirection.rawValue

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
            
            currentDirection = currentDirection == .rick ? .morty : .rick // делаем так, чтобы было чередование ходов шашек
             default: break }
        
    


    }

}
