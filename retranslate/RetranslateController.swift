//
//  ViewController.swift
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit

class RetranslateController: UIViewController, RequestCallbackDelegate {

    var retranslateDataStore:RetranslateDataStore
    var service:RetranslateService?
    var resultsViewController:ResultsViewController?
    @IBOutlet weak var retranslateText: GCPlaceholderTextView!
    @IBOutlet weak var retranslateButton: UIButton!
    @IBOutlet weak var clearRetranslation: UIButton!
    @IBOutlet weak var retranslationList: UITableView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    init(retranslateDataStore: RetranslateDataStore){
        self.retranslateDataStore = retranslateDataStore
        super.init(nibName: "RetranslateController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func retranslatePressed(sender: AnyObject){
        progressIndicator.startAnimating()
        service?.getRetranslation(retranslateText.text)
        navigationController?.pushViewController(resultsViewController!, animated: true)
    }
    
    //service completed request
    func requestCompleted(requestName: String){
        progressIndicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        resultsViewController = ResultsViewController(retranslateDataStore: retranslateDataStore)
        service = RetranslateService(delegate: resultsViewController!,  retranslateDataStore: retranslateDataStore)
        retranslateText.text = ""
        retranslateText.layer.borderWidth = 1.0
        retranslateText.clipsToBounds = true
        retranslateText.layer.cornerRadius = 10.0
        retranslateText.placeholder = "Enter text to retranslate!"
        progressIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(animated: Bool) {
        progressIndicator.stopAnimating()
    }
    

}
