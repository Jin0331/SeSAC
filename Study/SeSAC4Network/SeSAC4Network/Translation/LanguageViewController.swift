//
//  LanguageViewController.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/18.
//

import UIKit

enum LanguageType {
    case source
    case target
    
    
}

class LanguageViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let data = [
        "ko": "한국어",
        "en": "영어",
        "ja": "일본어",
        "fr": "프랑스어"
    ]
    
    var type : LanguageType = .source // 0: 원본 언어, 1: 목적언어
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = type == .source ? "원본 언어 선택" : "목적 언어 선택"
        
        let item = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = item
        
    }
    
    @objc func saveButtonClicked() {
    /* if type == .source {
     navigationController?.popViewController(animated: true)
    } else {
     dismiss(animated: true)
    }*/
                
        switch type {
        case .source :
            navigationController?.popViewController(animated: true)
        case .target :
            dismiss(animated: true)
        }
    }
    
 

}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell") else { return UITableViewCell() }
        
        
        
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
