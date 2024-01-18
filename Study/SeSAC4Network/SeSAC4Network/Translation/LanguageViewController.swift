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

    var type : LanguageType = .source // 0: 원본 언어, 1: 목적언어
    
    var userSelect = "ko"
    
    let data = [
        "ko": "한국어",
        "en": "영어",
        "ja": "일본어",
        "fr": "프랑스어"
    ]
    
    lazy var list = data.sorted{ $0.key > $1.key}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(data)
        print(data.sorted{$0.key > $1.key})
        print(data.sorted{$0.key < $1.key})
        print(data.sorted{$0.value > $1.value})
        
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
        
        print(userSelect)
                
        switch type {
        case .source :
            UserDefaults.standard.set(userSelect, forKey: "source")
            navigationController?.popViewController(animated: true)
        case .target :
            UserDefaults.standard.set(userSelect, forKey: "target")
            dismiss(animated: true)
        }
        
        
    }
    
 

}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell") else { return UITableViewCell() }
        
        // UserDefaults에 저장된 값에 따라 텍스트 컬러 변경
        if let data = UserDefaults.standard.string(forKey: "source") {
            if data == list[indexPath.row].key {
                cell.textLabel?.textColor = .green
            } else {
                cell.textLabel?.textColor = .black
            }
        }
        
        
        cell.textLabel?.text = list[indexPath.row].value
        
        return cell
    }
    
    // userDeufalt를 이용한 값의 역전달
    // 저장 버튼을 클릭했을 떄, userDefualt에 저장되도록
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        userSelect = list[indexPath.row].key
        
    }
}
