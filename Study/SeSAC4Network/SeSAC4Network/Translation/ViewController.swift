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
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("View will appear")
        
        let sourceTitle = UserDefaultManager.shared.source
        sourceButton.setTitle(sourceTitle, for: .normal)
        
        let targetTitle = UserDefaultManager.shared.target
        targetButton.setTitle(targetTitle, for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    
    @objc func sourceButtonClicked() {
        let sb = UIStoryboard(name: "Language", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        vc.type = .source
        vc.userSelect = UserDefaultManager.shared.source
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func targetButtonClicked() {
        let sb = UIStoryboard(name: "Language", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        vc.type = .target
        vc.userSelect = UserDefaultManager.shared.target
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    @objc func translateButtonClicked() {
        
        TranslationAPIManager.shared.callRequest(text: sourceTextView.text) { result in
            
            self.targetLabel.text = result
        }
        
        
    }

}

