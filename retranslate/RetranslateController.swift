//
//  ViewController.swift
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit
import AlamoFire
import SwiftyJSON

class RetranslateController: UIViewController {

    @IBOutlet weak var retranslateText: GCPlaceholderTextView!
    @IBOutlet weak var retranslateButton: UIButton!
    @IBOutlet weak var clearRetranslation: UIButton!
    
    @IBAction func clearRetranslate(sender: AnyObject) {
        retranslateText.text = ""
        retranslateText.resignFirstResponder()
    }
    
    struct TranslationPhrase {
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
//        
//        let params = ["api": "true", "translation[starting_phrase]": "jack sprat could eat no fat"]
//        
//        manager.request(.POST, "http://localhost:3000/translations.json", parameters: params).responseJSON { (req, res, json, error) in
//            if(error != nil) {
//                NSLog("Error: \(error)")
//                println(req)
//                println(res)
//            }
//            else {
//                println("Success: \(req)")
//                }
//            }
//        }
//            //responseString { (_, _, response, _) in println("--> \(response)") }
//        
    }
    
    override init() {
        super.init()
    }

    override func viewDidAppear(animated: Bool) {
        retranslateText.text = ""
        retranslateText.layer.borderWidth = 1.0
        retranslateText.clipsToBounds = true
        retranslateText.layer.cornerRadius = 10.0
        retranslateText.placeholder = "Enter text to retranslate!"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "RetranslateView", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
