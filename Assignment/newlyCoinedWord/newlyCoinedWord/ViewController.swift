//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by JinwooLee on 12/28/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var wordButtonCollection : [UIButton]!
    // outlet collection은 array로 선언되기 때문에, weak을 사용할 수 없음
    
    let wordDict : [String : String] = ["버카충":"버스카드 충전을 줄여서 말",
                                        "쫌쫌따리":"아주 조금씩 적고 하찮은 양을 모으는 모습",
                                        "억텐":"억지 텐션의 줄임말",
                                        "스불재":"스스로 불러온 재앙",
                                        "좋댓구알":"좋아요, 댓글, 구독, 알림설정의 줄임말",
                                        "어쩔티비":"어쩌라고 가서 TV나봐라라는 뜻",
                                        "갓생":"말그대로 갓(God)+생(生)",
                                        "군싹":"군침이 싹도네의 줄임말"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextfield.delegate = self // delegate 써야됨
        searchTextfield.layer.borderColor = UIColor.black.cgColor
        searchTextfield.layer.borderWidth = 2
        searchTextfield.keyboardType = .default
        
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.image = .background
        
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 4
        
        designButton()
        
        
//        searchButton.layer.borderColor = UIColor.black.cgColor
//        searchButton.backgroundColor = .black
//        searchButton.setTitle("", for: .normal)
//        searchButton.setBackgroundImage(UIImage(named: "magnifyingglass"), for: .normal)
//        searchButton.setTitleColor(.white, for: .normal)
// 좀더 찾아봐야될 듯...
        
    }

    @IBAction func recommandButtonClicked(_ sender : UIButton){
        searchTextfield.text = sender.currentTitle
    }
    
    @IBAction func showButton(_ sender: UIButton) {
        resultLabel.text = wordDict[searchTextfield.text!]
    }
    
    @IBAction func hideKeybord(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func designButton() {
        
        let keyList = Array(wordDict.keys)
        
        for index in 0...wordButtonCollection.count - 1 {
            
            wordButtonCollection[index].setTitle(keyList[index], for: .normal)
            wordButtonCollection[index].setTitleColor(.black, for: .normal)
            wordButtonCollection[index].titleLabel?.font = .systemFont(ofSize: 5)
            wordButtonCollection[index].contentHorizontalAlignment = .center
//            wordButtonCollection[index].sizeToFit()
            wordButtonCollection[index].layer.borderColor = UIColor.black.cgColor
            wordButtonCollection[index].layer.borderWidth = 2
            wordButtonCollection[index].layer.cornerRadius = 15
        }
    }
    
    /*
     흠......... 여기 참고함.
     https://stackoverflow.com/questions/24150932/swift-uitextfieldshouldreturn-return-key-tap
    
     */
    func textFieldShouldReturn(_ textField : UITextField) -> Bool { // delegate method???
        
        if textField == searchTextfield {
            textField.resignFirstResponder()
            resultLabel.text = wordDict[textField.text!]
        }
        return true
    }
    
    
    
}

