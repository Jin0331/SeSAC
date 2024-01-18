//
//  LottoAPIManager.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/16.
//

import Foundation
import Alamofire

struct LottoAPIManager {
    
    func callRequest(number: String, completionHandler: @escaping (String) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
       
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                print(success.drwNoDate)
                print(success.drwtNo1)
                
                //self.dateLabel.text = success.drwNoDate
                completionHandler(success.drwNoDate)
                
            case .failure(let failure):
                print("오류 발생")
            }
        }
    }
    
}



