//
//  SignViewController.swift
//  Day1-Assignment
//
//  Created by JinwooLee on 12/28/23.
//

import UIKit

class SignViewController: UIViewController {

    
    @IBOutlet weak var first_textfield: UITextField!
    @IBOutlet weak var second_textfield: UITextField!
    @IBOutlet weak var third_textfield: UITextField!
    @IBOutlet weak var four_textfield: UITextField!
    @IBOutlet weak var five_textfield: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var mainSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first_textfield.placeholder = "이메일 주소 또는 전화번호"
        first_textfield.backgroundColor = .darkGray
        first_textfield.textColor = .white
        first_textfield.font = .boldSystemFont(ofSize: 15)
        first_textfield.textAlignment = .center
        first_textfield.keyboardType = .default
//        first_textfield.isSecureTextEntry = true
        
        second_textfield.placeholder = "비밀번호"
        second_textfield.backgroundColor = .darkGray
        second_textfield.textColor = .white
        second_textfield.font = .boldSystemFont(ofSize: 15)
        second_textfield.textAlignment = .center
        second_textfield.keyboardType = .default
        second_textfield.isSecureTextEntry = true
        
        third_textfield.placeholder = "닉네임"
        third_textfield.backgroundColor = .darkGray
        third_textfield.textColor = .white
        third_textfield.font = .boldSystemFont(ofSize: 15)
        third_textfield.textAlignment = .center
        third_textfield.keyboardType = .default
//        third_textfield.isSecureTextEntry = true
        
        four_textfield.placeholder = "위치"
        four_textfield.backgroundColor = .darkGray
        four_textfield.textColor = .white
        four_textfield.font = .boldSystemFont(ofSize: 15)
        four_textfield.textAlignment = .center
        four_textfield.keyboardType = .default
//        four_textfield.isSecureTextEntry = true
        
        five_textfield.placeholder = "추천 코드 입력"
        five_textfield.backgroundColor = .darkGray
        five_textfield.textColor = .white
        five_textfield.font = .boldSystemFont(ofSize: 15)
        five_textfield.textAlignment = .center
        five_textfield.keyboardType = .default
        five_textfield.isSecureTextEntry = true
        
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
    
}
