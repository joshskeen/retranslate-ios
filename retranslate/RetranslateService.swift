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
    let translationsEndPoint = "\(baseUrl)/translations.json"
    let retranslateDataStore:RetranslateDataStore
    let delegate:RequestCallbackDelegate
    let manager:Alamofire.Manager
    
    init(delegate:RequestCallbackDelegate, retranslateDataStore:RetranslateDataStore){
        
        var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["Content-Type"] = RetranslateService.formEncodedContentType
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
     
        self.delegate = delegate
        self.manager = Alamofire.Manager(configuration: configuration)
        self.retranslateDataStore = retranslateDataStore
    }
    
    func getRetranslation(startingPhrase:String ){
        let params = ["translation[starting_phrase]":startingPhrase, "api":"true"]
        manager.request(.POST, translationsEndPoint, parameters: params)
            .responseSwiftyJSON { (request, response, json, error) in
                if( error != nil) {
                    println("errr! \(error)")
                } else {
                    println("request successful. got : \(json) with response of \(response)")
                    println("parsed: \(Translation(response: json))")
                    self.retranslateDataStore.lastTranslation = Translation(response: json)
                }
        }
    }
    
}