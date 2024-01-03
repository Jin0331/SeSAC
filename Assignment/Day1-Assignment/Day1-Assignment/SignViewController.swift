//
//  SignViewController.swift
//  Day1-Assignment
//
//  Created by JinwooLee on 12/28/23.
//

import UIKit

class SignViewController: UIViewController {
        
    @IBOutlet var textfieldCollection : [UITextField]!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var mainSwitch: UISwitch!
    
    let phList : [String] = ["메일 주소 또는 전화번호", "비밀번호", "닉네임", "위치", "추천 코드 입력"]
    let phNotList : [String] = ["닉네임", "위치", "추천 코드 입력"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...textfieldCollection.count - 1 {
            designTextfield(textfieldCollection[index], placeholder: phList[index])
        }
        
        // 회원 가입 버튼
        mainButton.setTitle("회원가입", for: .normal)
        mainButton.setTitleColor(.black, for: .normal)
        mainButton.backgroundColor = .white
        mainButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        
        mainSwitch.setOn(true, animated: false)
        mainSwitch.onTintColor = .red
    }

    @IBAction func actionButton(_ sender: UIButton) {
        view.endEditing(true)
    }
    @IBAction func keyboardHideGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func addInformationSwitch(_ sender: UISwitch) {
        
        if !sender.isOn {
            for index in 2...textfieldCollection.count - 1 {
                textfieldCollection[index].isHidden = true
            }
        } else {
            for index in 2...textfieldCollection.count - 1 {
                textfieldCollection[index].isHidden = false
            }
        }
    }
    
    // Textfield 디자인 변경
    func designTextfield(_ textfield : UITextField, placeholder ph : String) {
        
        textfield.placeholder = ph
        textfield.backgroundColor = .darkGray
        textfield.textColor = .white
        textfield.font = .boldSystemFont(ofSize: 15)
        textfield.textAlignment = .center
        textfield.keyboardType = .default
    }
}
