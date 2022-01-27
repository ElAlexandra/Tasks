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
    @IBOutlet weak var helloLabel : UILabel!
    @IBOutlet weak var congratulationsLabel : UILabel!
    @IBOutlet weak var winnerLabel : UILabel!
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    
    var chessboard: UIView!
    var stopButtonTimer: Bool = false
    var timer: Timer?
    var countTickMin: Int = 0
    var countTickSec: Int = 0
    var checkerImage: UIImageView!
    var currentDirection: DirectionCheckers = .rick
    var savedCheckers: [Checker] = []
    var styleOfChecker = StyleOfChecker(whiteChecker: "style1WhiteChecker", blackChecker: "style1BlackChecker", stateSwitch: true)
    
//    var checkersPosition: Checker = Checker()
    
    var cellsForMove : [UIView] = []
    var names: [String] = []
    var saveData: SaveData? = nil
    var movingPlayer: String = ""
    var playerWithWhiteChecker: String = ""
    var playerWithBlackChecker: String = ""
    var canFight: Bool = false
    var mass: [(checker: Int, cell: Int, checkerBeaten: Int)] = []
    

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
        
        var s = 0 // счётчик для тагов клетки
        var c = 0 // счётчик для тагов шашки
        
        for i in 0..<8 {
            for j in 0..<8 {
                let cell = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                cell.backgroundColor = ((i + j) % 2) == 0 ? .white : .black
                cell.tag = s
               
                chessboard.addSubview(cell)
                s += 1
                
//                guard !savedCheckers.isEmpty else {
                guard j < 3 || j > 4, cell.backgroundColor == .black else { continue }
                
                checkerImage = UIImageView(frame: CGRect(x: 5.0, y: 5.0, width: 30, height: 30))
                checkerImage.image = UIImage(named: j < 3 ? "рик2" : "морти")
                checkerImage.tag = c
                checkerImage.layer.cornerRadius = checkerImage.frame.height / 2.0
                checkerImage.clipsToBounds = true
                checkerImage.isUserInteractionEnabled = true
                
                    checkerImage.tag = c
                    c += 1
//                    continue
//                }
                cell.addSubview(checkerImage)
               
                if let checker = savedCheckers.first(where:{$0.positionTag == cell.tag}) {
                    checkerImage.image = UIImage(named: checker.checkerTag < 12 ? styleOfChecker.whiteChecker! : styleOfChecker.blackChecker!)
                    checkerImage.tag = checker.checkerTag
                }
                
            
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
        chessboard.center = view.center
    }
    
    func getName() {
        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("savedNames").path) {
            names = SaveData.getNamesOfPlayer()
            helloLabel.text = "Hello \(names[0]) and \(names[1])!"
            
            playerWithWhiteChecker = names.randomElement()!
            names.forEach { player in
                if player != playerWithWhiteChecker {
                    playerWithBlackChecker = player
                }
            }
        } else {
            guard let name1 = saveData!.nameOfPlayer1, let name2 = saveData!.nameOfPlayer2 else { return }
            helloLabel.text = "I am glad to see you again!"
            playerWithWhiteChecker = name1
            playerWithBlackChecker = name2
        }
        
    }

    func getSaveData() {
        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("savedGame").path) {
            saveData = SaveData.getSaveGame()
            savedCheckers = saveData?.savedCheckersPosition as! [Checker]
            
            countTickSec = (saveData?.savedCountSeconds)!
            countTickMin = (saveData?.savedCountMinutes)!
            
            currentDirection = saveData?.savedCurrentChecker == 0 ? .rick : .morty
        } else {
            timerLabel.text = "0\(countTickMin): \(countTickSec)"
//            timerLabel.text = (countTickSec % 60) < 10 ? "0\(countTickSec % 60)" : "\(countTickSec $ 60)"
        }
        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("styleOfChecker").path) {
            let stylesOfChecker = SaveData.getStyleChecker()
            
            stylesOfChecker.forEach { style in
                if style.stateSwitch == true {
                    styleOfChecker = style
                }
            }
        }
    }
//        guard manager.fileExists(atPath: documentDirectory.appendingPathComponent("imageForPlayScreen").path)
//                imageForPlayScreen.image = SaveData.getImageForScreen()
//    }
//
    func saveCheckers() -> [Checker] {
        savedCheckers = []
        chessboard.subviews.forEach { cell in
//            cell.removeBlurView()
        }
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                cell.subviews.forEach { checker in
                    let savedChecker = Checker(checkerTag: checker.tag, positionTag: cell.tag)
                    savedCheckers.append(savedChecker)
                }
            }
        }
        return savedCheckers
    }
    
    
    func findMoving(for checker: UIView) {
        let cell = checker.superview
        chessboard.subviews.forEach { cellForMove in
            guard cellForMove.subviews.isEmpty, cellForMove.backgroundColor == .blue, let startCell = cell else { return }
                    
                    let diff1 = currentDirection == .rick ? 7 : -7
                    let diff2 = currentDirection == .rick ? 9 : -9
                    
                    if cellForMove.tag == startCell.tag + diff1 || cellForMove.tag == startCell.tag + diff2 {
//                        cellForMove.addBlurView()
                        cellsForMove.append(cellForMove)
                    }
        }
    }
    
    func findFight() {
        let arrayOfChecker = saveCheckers()
        var startChecker: Checker? = nil
        var checkerForFight: Checker? = nil
        
        if currentDirection == .rick {
            
            arrayOfChecker.forEach { checker in
                if checker.checkerTag < 12 {
                    startChecker = checker
                }
                arrayOfChecker.forEach { fightChecker in
                    guard let startChecker = startChecker else { return }
                    
                    if fightChecker.checkerTag >= 12 && (fightChecker.positionTag == startChecker.positionTag) {
                        fightChecker.positionTag == startChecker.positionTag + 7 || ((fightChecker.positionTag - 7) != 0)
                        ((startChecker.positionTag - 9) != 0) || fightChecker.positionTag == startChecker.positionTag + 9
                        
                        checkerForFight = fightChecker
                        
                        chessboard.subviews.forEach { cell in
                            guard let checkerForFight = checkerForFight else { return }
                            
                            if cell.subviews.isEmpty, cell.backgroundColor == .blue, cell.tag == startChecker.positionTag && ((startChecker.positionTag - fightChecker.positionTag) != 0) {
                                
//                                cell.addBlurView()
                                cellsForMove.append(cell)
                                canFight = true
                                mass.append((checker: startChecker.checkerTag, cell: cell.tag, checkerBeaten: checkerForFight.checkerTag))
                            }
                        }
                    }
                }
            }
                
            } else {
            
            arrayOfChecker.forEach { checker in
                if checker.checkerTag >= 12 {
                    startChecker = checker
                }
                arrayOfChecker.forEach { fightChecker in
                    guard let startChecker = startChecker else { return }
                    
                    if fightChecker.checkerTag < 12 && (fightChecker.positionTag == startChecker.positionTag) {
                        fightChecker.positionTag == startChecker.positionTag + 7 || ((fightChecker.positionTag - 7) != 0)
                        ((startChecker.positionTag - 9) != 0) || fightChecker.positionTag == startChecker.positionTag + 9
                        
                        checkerForFight = fightChecker
                        
                        chessboard.subviews.forEach { cell in
                            guard let checkerForFight = checkerForFight else { return }
                            
                            if cell.subviews.isEmpty, cell.backgroundColor == .blue, cell.tag == startChecker.positionTag && (((startChecker.positionTag - checkerForFight.positionTag)) != 0) {
                                    
//                                    cell.addBlurView()
                                    cellsForMove.append(cell)
                                    canFight = true
                                    mass.append((checker: startChecker.checkerTag, cell: cell.tag, checkerBeaten: checkerForFight.checkerTag))

                            }

                        }
                    }

                }
            }
        }
    }
        
            func smartBlur(for checker: UIView) {
                
                chessboard.subviews.forEach { cell in
//                    cell.removeBlurView()
                }
                mass.forEach { tuple in
                    if checker.tag == tuple.checker {
                        chessboard.subviews.forEach { cell in
                            if cell.tag == tuple.cell {
//                                cell.addBlurView()
                            }
                        }
                    }
                }
            }
            
            
            func returnSmartBlur() {
                mass.forEach { tuple in
                    chessboard.subviews.forEach { cell in
                        if cell.tag == tuple.cell, cell.subviews.isEmpty {
                            
//                            cell.addBlurView()
                        }
                    }
                }
            }
            
            func congratulation() {
                let winner = winner()
                
                if winner != "" {
                    self.view.bringSubviewToFront(congratulationsLabel)
                    self.view.bringSubviewToFront(winnerLabel)
                    
                    timer?.invalidate()
                    timer = nil
                    
                    helloLabel.text = ""
                    
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
                        self.congratulationsLabel.center.y += self.view.bounds.height
                    }
                    winnerLabel.text = "\(winner) have won!"
                    
                    UIView.animate(withDuration: 2, delay: 0.3, options: .curveEaseOut) {
                        self.winnerLabel.center.y += self.view.bounds.height
                    }
                }
            }
    
            func winner() -> String {
                let checkChecker = saveCheckers()
                var blackCheckers: Int = 0
                var whiteCheckers: Int = 0
                var winner: String = ""
                checkChecker.forEach { checker in
                    if checker.checkerTag < 12 {
                        whiteCheckers += 1
                    } else {
                        blackCheckers += 1
                    }
                    }
                if whiteCheckers == 0 {
                    winner = playerWithBlackChecker
                }
                if blackCheckers == 0 {
                    winner = playerWithWhiteChecker
                }
                return winner
                }
            
            func crownChecker() {
                let massChecker = saveCheckers()
                var number: Int? = nil
                
                massChecker.forEach { checker in
                    if (checker.checkerTag < 12 && (checker.positionTag == 62 || checker.positionTag == 60 || checker.positionTag == 58 || checker.positionTag == 56)) || (checker.checkerTag >= 12 && (checker.positionTag == 1 || checker.positionTag == 3 || checker.positionTag == 5 || checker.positionTag == 7)) {
                        number = checker.positionTag
                    }
                }
                
                if let cell = chessboard.subviews.first(where:{$0.tag == number}) {
                    cell.subviews.forEach { checker in
                        let coronaImage = UIImageView(frame: CGRect(x: 0, y: 0, width: Int(checker.frame.width), height: Int(checker.frame.height)))
                        coronaImage.image = UIImage(named: "corona")
                        checker.addSubview(coronaImage)
                    }
                }
            }
            
            
            
    @objc func timerCount() {
        countTickSec += 1
        
        if countTickSec == 60 {
            countTickMin += 1
            countTickSec = 0
        }
        
        let sec = countTickSec < 10 ? " : 0\(countTickSec)" : " : \(countTickSec)"
        let min = countTickMin < 10 ? "0\(countTickMin)" : "  \(countTickMin)"
    
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
    
//    func savePositionCheckers() { // сохраняю данные в файл
//        let data = try? NSKeyedArchiver.archivedData(withRootObject: checkersPosition, requiringSecureCoding: true)
//        let fileURL = documentDirectory.appendingPathComponent("checkersPosition")
//        try? data?.write(to: fileURL)
//        }
//
//    func getPositionCheckers() { // достаю сохранённое из файла
//        let fileURL = documentDirectory.appendingPathComponent("checkersPosition")
//        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
//        guard let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: Checker.self, from: data) else { return }
//        self.checkersPosition = object
//    }
    
    func setBackground() -> UIView { // задаём фон
        let backgroungImage = UIImageView(image: UIImage(named: "wal"))
        let backgroungImageSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        backgroungImage.frame = CGRect(origin: .zero, size: backgroungImageSize)
        backgroungImage.layer.zPosition = -1
        return backgroungImage
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        presentAlertController(with: "Think about it!" , message: "Do you want save this game?", preferredStyle: .alert, actions: UIAlertAction(title: "YES", style: .default, handler: { _ in
        self.present(self.getViewController(from: "GreetingsViewController"), animated: true, completion: nil)
            self.saveDataToUserDefaults()
//            self.savePositionCheckers()
            self.navigationController?.popViewController(animated: true)
            }),
        UIAlertAction(title: "NO", style: .default, handler: { _ in
            self.present(self.getViewController(from: "GreetingsViewController"), animated: true, completion: nil)
        } ))
//        timer?.invalidate()
//        timer = nil
        
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        guard let checker = sender.view, (currentDirection == .rick && checker.tag < 12) || (currentDirection == .morty && checker.tag >= 12) else { return }
        switch sender.state {
        case .began:
            
            smartBlur(for: checker)
            
            if canFight == false {
                cellsForMove.removeAll()
                findMoving(for: checker)
            }

            UIImageView.animate(withDuration: 0.3) {
                checker.transform = checker.transform.scaledBy(x: 1.3, y: 1.3) }
            
        case .ended:
            UIImageView.animate(withDuration: 0.3) {
                checker.transform = .identity }
            if canFight == false {
                chessboard.subviews.forEach { cell in
//                    cell.removeBlurView()
                }
            }
            
            returnSmartBlur()
            
        default:
            break } }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        
                
        guard let checker = sender.view, (currentDirection == .rick && checker.tag < 12) || (currentDirection == .morty && checker.tag >= 12) else { return }
//        checker.tag == currentDirection.rawValue else { return } // сможем ходить только шашкой которая является currentDirection.rawValue

        let location = sender.location(in: chessboard) // где нахдится курсор относительно доски
        let translation = sender.translation(in: chessboard)

        switch sender.state {
            
        case .changed:
            guard let column = sender.view?.superview, let cellOrigin = sender.view?.frame.origin else { return }
            chessboard.bringSubviewToFront(column)
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                y: cellOrigin.y + translation.y)
            

            sender.setTranslation(.zero, in: chessboard) // сбрасываем translation
            
        case .ended:
        
            UIImageView.animate(withDuration: 0.3) {
                sender.view?.transform = .identity
            }
           
            var currentCell: UIView? = nil // клетка на которой заканчивается движение
            var currentBeatenChecker: Int? = nil // шашка которую будем бить
            
            cellsForMove.forEach { cell in
                if canFight == true {
                    mass.forEach { tuple in
                        if checker.tag == tuple.checker, cell.tag == tuple.cell, cell.frame.contains(location) {
                            currentCell = cell
                            currentBeatenChecker = tuple.checkerBeaten
                    }
                }
            } else {
                if cell.frame.contains(location) {
                    currentCell = cell
                }
            }
            }
        sender.view?.frame.origin = CGPoint(x: 5, y: 5)
        guard let newCell = currentCell, let checker = sender.view else { return }
        newCell.addSubview(checker)
        
        chessboard.subviews.forEach { cell in
            cell.subviews.first(where: {$0.tag == currentBeatenChecker})?.removeFromSuperview()
            
        }
        crownChecker()
        congratulation()
        
        if canFight == true {
            canFight = false
            cellsForMove.removeAll()
            mass.removeAll()
            findFight()
            
            if canFight == true {
                mass.removeAll(where: {$0.checker != checker.tag})
                smartBlur(for: checker)
                if mass.isEmpty {
                    canFight = false
                }
            }
        }
        if canFight == false {
            currentDirection = currentDirection == .rick ? .morty : .rick
            helloLabel.text = currentDirection == .rick ? "\(playerWithWhiteChecker), your move" : "\(playerWithBlackChecker), your move"
            findFight()
        }
        default: break
    }
}
}
//            UIImageView.animate(withDuration: 0.3) {
//                sender.view?.transform = .identity

//
//            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.backgroundColor == .black })

          
        
            
//            currentDirection = currentDirection == .rick ? .morty : .rick // делаем так, чтобы было чередование ходов шашек
             
        
//        chessboard.subviews.forEach { cell in // удаляем шашку с поля
//            cell.subviews.first(where: {$0.tag == currentBetenChecker})?.removeFromSuperview()
//        }
        
       
//        func possibleSteps(tag: Int) {
//            switch tag {
//            case 4, 5, 12, 13, 20, 21, 28, 29:
//                possibleSteps = currentDirection == .rick ? [tag - 4, tag - 4] : [tag + 4, tag + 4]
//            case 1, 2, 3:
//                possibleSteps = [tag + 4, tag + 5]
//            case 30, 31, 32
//                possibleSteps = [tag - 4, tag - 5]
//            default:
//                let row = tag % 4 == 0 ? tag / 4 - 1 : tag / 4
//                if row % 2 == 0 {
//                    possibleSteps = currentDirection = .rick ? [tag - 4, tag - 3] : [tag + 4, tag + 5]
//                } else {
//                    possibleSteps = currentDirection = .rick ? [tag - 5, tag - 4] : [tag + 3, tag + 4]
//
//                }
//
//            }
//        }



    

