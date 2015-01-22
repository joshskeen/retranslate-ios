//
//  ViewController.swift
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit

class RetranslateController: UIViewController {

    let retranslateDataStore:RetranslateDataStore
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
        resultsViewController?.pendingReload = true
        animateTextBoxOut()
    }
    
    func animateTextBoxOut(){
        UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.retranslateText.alpha = 0.0
            }, completion: {
                finished in
                println("animateTextBoxOut!")
                self.navigationController?.pushViewController(self.resultsViewController!, animated: true)
        })
    }
    
    func animateTextBoxIn(){
        UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.retranslateText.alpha = 1
            }, completion: {
                finished in
                println("animatedTextBoxIn!")
        })
    }
    
    override func viewDidLoad() {
        resultsViewController = ResultsViewController(retranslateDataStore: retranslateDataStore)
        resultsViewController!.pendingReload = true
        service = RetranslateService(delegate: resultsViewController!,  retranslateDataStore: retranslateDataStore)
        retranslateText.text = ""
        retranslateText.layer.borderWidth = 1.0
        let color = UIColor.lightGrayColor().CGColor
        retranslateText.layer.borderColor = color
        retranslateText.layer.opacity = 0.7
        retranslateText.clipsToBounds = true
        retranslateText.layer.cornerRadius = 10.0
        retranslateText.placeholder = "Enter text to retranslate!"
        progressIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(animated: Bool) {
        progressIndicator.stopAnimating()
        retranslateText.alpha = 0
        animateTextBoxIn()
    }
    

}
