//
//  ResultsViewController.swift
//  retranslate
//
//  Created by josh skeen on 1/21/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, RequestCallbackDelegate {
    
    var retranslateDataStore:RetranslateDataStore
    var service:RetranslateService?
    var imageView:PASImageView?
    
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var retranslateButton: UIButton!
    @IBOutlet weak var resultsView: UITextView!
    @IBOutlet weak var viewHistoryButton: UIButton!
    @IBOutlet weak var fromText: UITextView!
    
    init(retranslateDataStore: RetranslateDataStore){
        self.retranslateDataStore = retranslateDataStore
        super.init(nibName: "ResultsViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func reReTranslate(sender: AnyObject) {
        progressIndicator.startAnimating()
        service?.getRetranslation(retranslateDataStore.lastTranslation!.startingPhrase)
        disableHistoryButton()
        disableRetranslateButton()
    }

    @IBAction func viewHistory(sender: AnyObject) {
        let rdc = RetranslateHistoryController(retranslateDataStore: retranslateDataStore)
        navigationController?.pushViewController(rdc, animated: true)
    }
    
    func requestCompleted(requestName: String){
        if let x = retranslateDataStore.lastTranslation{
           self.setupRetranslationDisplay()
        }
    }
    
    func setupRetranslationDisplay(){
        progressIndicator.stopAnimating()
        enableRetranslateButton()
        enableHistoryButton()
        fromText.text = "from: \(retranslateDataStore.lastTranslation!.startingPhrase)"
        resultsView.text = retranslateDataStore.lastTranslation!.endingPhrase
        if let anURL = NSURL(string: retranslateDataStore.lastTranslation!.imgUrl) {
            imageView!.imageURL(anURL)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if retranslateDataStore.lastTranslation == nil {
            disableHistoryButton()
        } else {
            enableHistoryButton()
        }
    }
    
    func enableRetranslateButton(){
        retranslateButton.enabled = true
        retranslateButton.alpha = 1
    }
    
    func disableRetranslateButton(){
        retranslateButton.enabled = false
        retranslateButton.alpha = 0.3
    }
    
    func enableHistoryButton(){
        viewHistoryButton.enabled = true
        viewHistoryButton.alpha = 1
    }
    
    func disableHistoryButton(){
        viewHistoryButton.enabled = false
        viewHistoryButton.alpha = 0.3
    }
    
    func sayHello(sender: UIBarButtonItem) {
        println("!!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.hidesWhenStopped = true
        
        
        
        service = RetranslateService(delegate: self,  retranslateDataStore: retranslateDataStore)
        imageView = PASImageView(frame: CGRectMake(0, 0, 300, 300))
        view.addSubview(imageView!)
        imageView!.center = CGPointMake(view.bounds.width / 2, (view.bounds.height / 2) + 25)
        imageView!.backgroundProgressColor(UIColor.whiteColor())
        imageView!.progressColor(UIColor.redColor())
    }
    
}
