//
//  PreparationService.swift
//  UIView
//
//  Created by TuVA1.FSU1 on 10/23/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

var url = "http://finos-lending-congds-1616634020.ap-southeast-1.elb.amazonaws.com:8895/content-service/api/v1/merchants/preparation"
var header : [String: String] {
    return [
        "Content-Type": "application/json;charset=UTF-8",
        "lang" : "vi"
    ]
}

class PreparationService {
    static let sharedInstance = PreparationService()
    func getPreparationContent(completion: @escaping (_ error: String?, _ value: [Preparation]?) -> ()) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseString {(response) in
            var listPreparation = [Preparation]()
            if response.result.error == nil {
                if let data = response.data {
                    do {
                        let json = try JSON(data: data)
                        if let preparations = json["data"].array {
                            for preparation in preparations {
                                let info = preparation["info"].stringValue
                                let imageURL = preparation["imageURL"].stringValue
                                let description = preparation["description"].stringValue
                                listPreparation.append(Preparation(info: info, description: description, imageURL: imageURL))
                            }
                            completion(nil, listPreparation)
                        }
                        completion(nil, nil)
                    } catch {
                        print("Error")
                        //completion(error.localizedDescription, nil)
                        completion(nil, nil)
                    }
                }
            } else {
                print("Error")
                //completion(response.result.error?.localizedDescription, nil)
                completion(nil, nil)
            }
        }
    }
}

