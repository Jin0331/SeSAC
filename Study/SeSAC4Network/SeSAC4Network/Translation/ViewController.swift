//
//  ViewController.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/16.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var sourceButton: UIButton!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var targetButton: UIButton!
    @IBOutlet var sourceTextView: UITextView!
    @IBOutlet var translateButton: UIButton!
    @IBOutlet var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translateButton.addTarget(self, action: #selector(translateButtonClicked), for: .touchUpInside)
        sourceButton.addTarget(self, action: #selector(sourceButtonClicked), for: .touchUpInside)
        targetButton.addTarget(self, action: #selector(targetButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func sourceButtonClicked() {
        let sb = UIStoryboard(name: "Language", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        vc.type = .source
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func targetButtonClicked() {
        let sb = UIStoryboard(name: "Language", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        vc.type = .target
        
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
    @objc func translateButtonClicked() {
        
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        //sadfsaf
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.clientID,
            "X-Naver-Client-Secret": APIKey.clientSecret
        ]
        
        let parameters: Parameters = [
            "text": sourceTextView.text!,
            "source": "ko",
            "target": "en"
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: headers).responseDecodable(of: Papago.self) { response in
            
            switch response.result {
            case .success(let success):
                print(success)
                
                self.targetLabel.text = success.message.result.translatedText
                
            case .failure(let failure):
                print(failure)
            }
            
        }
        
        
    }

}

