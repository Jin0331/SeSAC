//
//  NewViewController.swift
//  newlyCoinedWord
//
//  Created by JinwooLee on 12/30/23.
//

import UIKit

class NewViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet var buttonList : [UIButton]!
    @IBOutlet weak var resultLabel : UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    /*
     Dictionary에서 Array로 변경하였습니다.
     */
    
    let newWord : [String] = ["버카충", "쫌쫌따리", "억텐", "스불재", "좋댓구알", "어쩔티비", "갓생", "군싹"]
    let newWordMean : [String] = ["버스카드 충전을 줄여서 말",
                                  "아주 조금씩 적고 하찮은 양을 모으는 모습",
                                  "억지 텐션의 줄임말",
                                  "스스로 불러온 재앙",
                                  "좋아요, 댓글, 구독, 알림설정의 줄임말",
                                  "어쩌라고 가서 TV나봐라라는 뜻",
                                  "말그대로 갓(God)+생(生)",
                                  "군침이 싹도네의 줄임말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색하는 Button 디자인
        searchButton.setTitle("", for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        
        // Textfield
        searchTextfield.delegate = self // delegate 써야됨
        searchTextfield.layer.borderColor = UIColor.black.cgColor
        searchTextfield.layer.borderWidth = 2
        searchTextfield.keyboardType = .default
        
        // 결과 label
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 2
        
        // background image View
        backgroundImage.image = .background
        backgroundImage.contentMode = .scaleAspectFill
        
        
        
        designButton()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        let findIndex = newWord.firstIndex(of: searchTextfield.text!.lowercased()) // 검색할 때 무조건 소문자로 검색
        resultLabel.text = newWordMean[findIndex!]
    }
    
    @IBAction func recommandButton(_ sender: UIButton) {
        searchTextfield.text = sender.currentTitle
    }
    
    @IBAction func keybordHide(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func designButton() {
        
        for index in 0...buttonList.count - 1 {
            
            buttonList[index].setTitle(newWord[index], for: .normal)
            buttonList[index].setTitleColor(.black, for: .normal)
            buttonList[index].titleLabel?.font = .systemFont(ofSize: 5)
            buttonList[index].contentHorizontalAlignment = .center
//            wordButtonCollection[index].sizeToFit()
            buttonList[index].layer.borderColor = UIColor.black.cgColor
            buttonList[index].layer.borderWidth = 2
            buttonList[index].layer.cornerRadius = 15
        }
    }
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool { // delegate method???
        
        if textField == searchTextfield {
            textField.resignFirstResponder()
            resultLabel.text = textField.text
            
            let findIndex = newWord.firstIndex(of: textField.text!.lowercased())
            resultLabel.text = newWordMean[findIndex!]
        }
        return true
    }
}
