//
//  TranslationAPIManager.swift
//  SeSAC4Network
//
//  Created by JinwooLee on 1/23/24.
//

import Foundation
import Alamofire
import UIKit

class TranslationAPIManager {
    
    static let shared = TranslationAPIManager()
    
    private init() {}
    
    enum APImehtod {
        case get
        case post
    }
    
    let baseURL = "https://openapi.naver.com/v1/papago/"
    //sadfsaf
    let headers: HTTPHeaders = [
        "X-Naver-Client-Id": APIKey.clientID,
        "X-Naver-Client-Secret": APIKey.clientSecret
    ]
    
    
    func callRequest(text : String, completionHandler : @escaping (String) -> Void) {
        let url = baseURL + "n2mt"
        
        let parameters: Parameters = [
            "text": text,
            "source": "ko",
            "target": "en"
        ]

        AF.request(url, method: .post, parameters: parameters, headers: headers).responseDecodable(of: Papago.self) { response in
            
            switch response.result {
            case .success(let success):
                print(success)
                
                let text = success.message.result.translatedText
                completionHandler(text)
                
            case .failure(let failure):
                print(failure)
            }
            
        }
    }
}
