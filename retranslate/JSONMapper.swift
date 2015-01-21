//
//  TranslationData.swift
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit
import SwiftyJSON

struct JSONMapper {
    
    static func parseTranslationFromJSON(json:JSON) -> Translation {
        return Translation(TranslationData: json)
    }
    
}