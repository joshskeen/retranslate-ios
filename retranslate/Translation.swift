//
//  Translation.swift
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Translation {
    let startingPhrase:String
    let endingPhrase:String
    let id:Int
    
    init(translationJSON:JSON){
        startingPhrase = translationJSON["translation"]["starting_phrase"].stringValue
        endingPhrase = translationJSON["translation"]["ending_phrase"].stringValue
        id = translationJSON["translation"]["ending_phrase"].intValue
    }
}