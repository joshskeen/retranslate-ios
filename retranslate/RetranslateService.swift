//
//  RetranslateService.swift
//  retranslate
//
//  Created by josh skeen on 1/20/15.
//  Copyright (c) 2015 josh skeen. All rights reserved.
//

import UIKit
import AlamoFire
import SwiftyJSON

struct RetranslateService {
    
    static let baseUrl = "http://localhost:3000"
    static let formEncodedContentType:String = "application/x-www-form-urlencoded"
    static let translationsEndPoint = "\(baseUrl)/translations.json"
    
    let manager:Alamofire.Manager
    
    init(){
        var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["Content-Type"] = RetranslateService.formEncodedContentType

        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
        
        manager = Alamofire.Manager(configuration: configuration)
    }
    
    func getRetranslation(startingPhrase:String ){
        
        manager.request(.POST, translationsEndPoint, parameters: params).responseJSON { (req, res, json, error) in
        if(error != nil) {
            NSLog("Error: \(error)")
            println(req)
            println(res)
        }
        else {
            
            }
        }
    }
    
}
