//
//  CheckersCollectionViewCell.swift
//  Checkers
//
//  Created by Александра  Значёнок on 29.08.21.
//

import UIKit

class CheckersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var checkerImage: UIImage?
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   
    
//    var checkers1: UIImage = UIImage(named: "Картман1 шашки")!
//    var checkers2: UIImage = UIImage(named: "Гомер шашки")!
//    var checkers3: UIImage = UIImage(named: "Гриффин1 шашки")!
//    var checkers4: UIImage = UIImage(named: "ДартВейдер шашки")!
//    var checkers5: UIImage = UIImage(named: "Йода шашки")!
//    var checkers6: UIImage = UIImage(named: "Полотенчик шашки")!
//    var checkers7: UIImage = UIImage(named: "Штурмовик шашки")!
//    var checkers8: UIImage = UIImage(named: "Стюи шашки")!
    
    
    func setup(with image: CheckersImage) {
        imageView.image = checkerImage
    }
    
    
    
}



