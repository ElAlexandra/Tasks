//
//  Ckeckers.swift
//  Checkers
//
//  Created by Александра  Значёнок on 19.08.21.
//

import UIKit

class Checker: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var checkerTag: Int
    var positionTag: Int
    
    init(checkerTag: Int, positionTag: Int) {
        self.checkerTag = checkerTag
        self.positionTag = positionTag 
    }
//    var currentcheckersImage: UIImageView? = nil
//    var cellTag: Int? = nil
//    var checkerTag: Int? = nil
    
//    override init() {
//        super.init()
//    }
    
    func encode(with coder: NSCoder) { // кодировка
        coder.encode(checkerTag, forKey: "checkerTag")
        coder.encode(positionTag, forKey: "positionTag")
//        coder.encode(currentcheckersImage, forKey: KeysUserDefaults.currentcheckersImage.rawValue)
//        coder.encode(checkerTag, forKey: KeysUserDefaults.checkerTag.rawValue)
//        coder.encode(cellTag, forKey: KeysUserDefaults.cellTag.rawValue)
    }
    
    required init?(coder: NSCoder) { // декодировка
        self.checkerTag = coder.decodeObject(forKey: "checkerTag") as? Int ?? -1
        self.positionTag = coder.decodeObject(forKey: "positionTag") as? Int ?? -1
//        self.cellTag = coder.decodeObject(forKey: KeysUserDefaults.cellTag.rawValue) as? Int
//        self.checkerTag = coder.decodeObject(forKey: KeysUserDefaults.checkerTag.rawValue) as? Int
//        self.currentcheckersImage = coder.decodeObject(forKey: KeysUserDefaults.currentcheckersImage.rawValue) as? UIImageView
//
        
        
//        checkerTag = checkerImage.tag 
    }
}

