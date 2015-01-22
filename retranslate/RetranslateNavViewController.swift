//
//  RetranslateNavViewController.swift
//  retranslate
//
//  Created by josh skeen on 1/21/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit

class RetranslateNavViewController {
    
    init(retranslateDataStore: RetranslateDataStore){
        super.init(nibName: "RetranslateNavViewController", bundle: nil)
    }
    
    @IBOutlet weak var translationImage: UIImageView!
    
    @IBAction func resultButton(sender: AnyObject) {
    }
    
    @IBAction func historyButton(sender: AnyObject) {
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
