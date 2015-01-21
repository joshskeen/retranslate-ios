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

class RetranslateController: UIViewController, RequestCallbackDelegate {

    var retranslateDataStore:RetranslateDataStore
    var service:RetranslateService?
    @IBOutlet weak var retranslateText: GCPlaceholderTextView!
    @IBOutlet weak var retranslateButton: UIButton!
    @IBOutlet weak var clearRetranslation: UIButton!
    
    init(retranslateDataStore: RetranslateDataStore){
        self.retranslateDataStore = retranslateDataStore
        super.init(nibName: "RetranslateView", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func clearRetranslate(sender: AnyObject) {
        retranslateText.text = ""
        retranslateText.resignFirstResponder()
    }

    //service completed request
    func requestCompleted(requestName: String){
        println("request completed. Request: \(requestName). Update UI")
    }
    
    override func viewDidLoad() {
        service = RetranslateService(delegate: self,  retranslateDataStore: retranslateDataStore)
    }
    
    override func viewDidAppear(animated: Bool) {
        retranslateText.text = ""
        retranslateText.layer.borderWidth = 1.0
        retranslateText.clipsToBounds = true
        retranslateText.layer.cornerRadius = 10.0
        retranslateText.placeholder = "Enter text to retranslate!"
    }
    
    
    @IBAction func retranslatePressed(sender: AnyObject) {
        service?.getRetranslation(retranslateText.text)
    }

}
