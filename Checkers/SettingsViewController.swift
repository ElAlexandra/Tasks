//
//  SettingsViewController.swift
//  Checkers
//
//  Created by Александра  Значёнок on 26.07.21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var dataSource : [CheckersImage] = [
        CheckersImage(checkersImage: UIImage(named: "B")!),
        CheckersImage(checkersImage: UIImage(named: "F")!),
        CheckersImage(checkersImage: UIImage(named: "G")!),
        CheckersImage(checkersImage: UIImage(named: "K")!),
        CheckersImage(checkersImage: UIImage(named: "P")!),
        CheckersImage(checkersImage: UIImage(named: "S")!),
        CheckersImage(checkersImage: UIImage(named: "T")!),
        CheckersImage(checkersImage: UIImage(named: "V")!)
        
    ]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        
       
    }
        
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CheckersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CheckersCollectionViewCell")
    }
    
    
    
    @IBAction func menuButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        present(getViewController(from: "AboutViewController"), animated: true, completion: nil)

    }
     
    }

extension SettingsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
     return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CheckersCollectionViewCell", for: indexPath) as? CheckersCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: dataSource[indexPath.item])
    
        return cell
    }
    
    

}
extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 60)
    }
}

