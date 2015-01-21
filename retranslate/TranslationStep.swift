//
//  TranslationStep.swift
//  retranslate
//
//  Created by josh skeen on 1/21/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct TranslationStep : Printable {
//    {
//    "translation_id" : 13,
//    "to_language" : "mww",
//    "id" : 267,
//    "created_at" : "2015-01-21T19:09:41Z",
//    "from_language" : "ja",
//    "ending_phrase" : "Noj mov nkaus SPRAT rog",
//    "language" : null,
//    "next_translation_step" : null,
//    "updated_at" : "2015-01-21T19:09:41Z",
//    "previous_translation_step" : null,
//    "starting_phrase" : "JACK SPRAT 脂肪を食べられなかった"
//    },
    
    static let languages = [
        "ar": "Arabic",
        "ja": "Japanese",
        "bg": "Bulgarian",
        "ko": "Korean",
        "ca": "Catalan",
        "lv": "Latvian",
        "lt": "Lithuanian",
        "no": "Norwegian",
        "cs": "Czech",
        "fa": "Persian",
        "da": "Danish",
        "pl": "Polish",
        "nl": "Dutch",
        "pt": "Portuguese",
        "en": "English",
        "ro": "Romanian",
        "et": "Estonian",
        "ru": "Russian",
        "fi": "Finnish",
        "sk": "Slovak",
        "fr": "French",
        "sl": "Slovenian",
        "de": "German",
        "es": "Spanish",
        "el": "Greek",
        "sv": "Swedish",
        "ht": "Haitian Creole",
        "th": "Thai",
        "he": "Hebrew",
        "tr": "Turkish",
        "hi": "Hindi",
        "uk": "Ukrainian",
        "mww": "Hmong Daw",
        "vi": "Vietnamese",
        "hu": "Hungarian",
        "ur": "Urdu",
        "cy": "Welsh",
        "ms": "Malay",
        "tlh": "Klingon"
    ]

    
    let id:Int
    let toLanguage:String
    let fromLanguage:String
    let startingPhrase:String
    let endingPhrase:String
    
    init(_ response:JSON){
        id = response["id"].intValue
        toLanguage = TranslationStep.languages[response["to_language"].stringValue]!
        fromLanguage = TranslationStep.languages[response["from_language"].stringValue]!
        startingPhrase = response["starting_phrase"].stringValue
        endingPhrase = response["ending_phrase"].stringValue
    }
    
    static func parseTranslationSteps(response:JSON) -> [TranslationStep] {
        let translationSteps = response["translation_steps"]
        var steps = [TranslationStep]()
        for stepJson in translationSteps {
            steps.append(TranslationStep(stepJson.1))
        }
        return steps
    }
    
    var description: String {
        return "(id: \(id)), toLang: \(toLanguage), fromLang\(fromLanguage), start: \(startingPhrase), end: \(endingPhrase)"
    }
    
}