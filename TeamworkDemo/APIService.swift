//
//  APIService.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import ObjectMapper

class APIService {
    
    private let baseURL = "https://knockkdoc.teamwork.com/"
    
    var headers: HTTPHeaders {
        let username = Bundle.main.object(forInfoDictionaryKey: "teamworkApiKey") as! String
        let password = ""
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let header = [
            "Authorization": "Basic \(base64LoginString)"
        ]
        
        return header
    }
    
    init() {
        
    }
    
    func fetchAPIData<T: Mappable>(partialURL: String, method: HTTPMethod, params: Parameters?, returningType: T.Type, callback: @escaping (Result<T>) -> ()) {
        
        let url = self.baseURL + partialURL
        
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: self.headers)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
            
                switch response.result {
                case .success(let apiResponse):
                    let apiData = Mapper<T>().map(JSONObject: apiResponse)!
                    callback(Result.success(apiData))
                    break
                case .failure( _):
                    switch (response.response?.statusCode)! {
                    case 400..<500:
                        callback(Result.error(TWError.requestError))
                        break
                    case 500..<600:
                        callback(Result.error(TWError.serverError))
                        break
                    default:
                        break
                    }
                    break
                }
        }
    }
    
    func setImageFromURL(url: String, imageView: UIImageView, isRoundedToCircle: Bool) {
        
        Alamofire.request(url).responseImage { (response) in
            debugPrint(response)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                
                if isRoundedToCircle {
                    imageView.image = image.af_imageRoundedIntoCircle()
                    
                } else {
                    imageView.image = image
                }
            }
        }
    }
}
