//
//  Ckeckers.swift
//  Checkers
//
//  Created by Александра  Значёнок on 19.08.21.
//

import UIKit

class Checkers: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var currentcheckersImage: UIImageView? = nil
    var cellTag: Int? = nil
    var checkerTag: Int? = nil
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) { // кодировка
        coder.encode(currentcheckersImage, forKey: KeysUserDefaults.currentcheckersImage.rawValue)
        coder.encode(checkerTag, forKey: KeysUserDefaults.checkerTag.rawValue)
        coder.encode(cellTag, forKey: KeysUserDefaults.cellTag.rawValue)
    }
    
    required init?(coder: NSCoder) { // декодировка
        self.cellTag = coder.decodeObject(forKey: KeysUserDefaults.cellTag.rawValue) as? Int
        self.checkerTag = coder.decodeObject(forKey: KeysUserDefaults.checkerTag.rawValue) as? Int
        self.currentcheckersImage = coder.decodeObject(forKey: KeysUserDefaults.currentcheckersImage.rawValue) as? UIImageView
        
        
        
//        checkerTag = checkerImage.tag 
    }
}

