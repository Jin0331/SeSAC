//
//  ViewController.swift
//  BMICalculation
//
//  Created by JinwooLee on 1/3/24.
//

/*
 이번 과제는 파고들면 파고들 수록 어려워지는 과제(?).. 간단하게 생각하면 금방 할 것 같다.
 (1) label은 변할 수 있는 가능성이 낮기때문에, xcode에서 inspector를 통해 작업
 (2) UITextField는 sender로 String Type이 들어온다
 (3) tapGesture를 통해서, textfield의 editing did end가 실행됨!!! 후후
 */

import UIKit

class ViewController: UIViewController {

    // MARK :- Constant value
    let MIN_HEIGHT : Double = 0.5 // 신생아 평균
    let MAX_HEIGHT : Double = 2.89 // M 기준.'키 289cm' 세계 최장신 후보 등장(https://www.bbc.com/korean/international-64142805)
    let MIN_WEIGHT : Double = 3.2 // Kg. 여아 신생아
    let MAX_WEIGHT : Double = 200 // Kg. 200...???
    
    // MARK :- IBOutlet
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightTextField.tag = 0 // 키 textfield의 tag 0
        weightTextField.tag = 1 // 키 textfield의 tag 1
        
        //        heightTextField.keyboardType = .default
        heightTextField.keyboardType = .decimalPad // 숫자 패드를 기준으로 했기때문에, 문자가 들어올 가능성은 없지만...

        
    }
    
    // heightTextField, weightTextField 둘다 연결
    @IBAction func editingTextfield(_ sender: UITextField) {
        // textfield에 입력이 끝난후, tapgesture가 실행될 때!!!
        // UItextField의 .text는 String type
        let currentText : Double? = Double(sender.text!)
        
        
        // tag == 0. height 판단
        if sender.tag == 0 { // height
            // if-let 사용
            if let currentText {
                // Double type일때
                // 제약 조건 : 범위
                // BMI는 M 기준이므로... textfield에서는 cm 또는 m를 자율 적으로 받을 수 있음. 물론, 제약을 걸 수 있지만, 사용자의 입장에서는 cm 또는 m를 생각하지 않고 받기 때문에~
                print(currentText)
                if currentText / 100 >= MIN_HEIGHT && currentText / 100 <= MAX_HEIGHT { // 사용자가 cm 기준으로 입력 했을 때.정상 범위
                    sender.text = String(currentText / 100)
                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.green.cgColor
                } else if currentText >= MIN_HEIGHT && currentText <= MAX_HEIGHT  { // 사용자가 m 기준으로 입력했을 때. 정상 범위
                    sender.text = String(currentText)
                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.green.cgColor

                } else {
                    sleep(1) // 자기만.족!
                    sender.text = nil
                    sender.placeholder = "지정된 범위를 벗어 났습니다."
                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.red.cgColor
                }
            } else {
                // nil. 즉, 문자 또는 공백 등 특수문자~
                sleep(1)
                sender.text = nil
                sender.placeholder = "숫자를 입력해주세요."
                sender.layer.borderWidth = 2
                sender.layer.borderColor = UIColor.red.cgColor
            }
        // tag == 1. weight 판단
        } else if sender.tag == 1 { // weight
            if let currentText { //몸무게는 반드시 kg 단위로 들어오겠지?
                if currentText >= MIN_WEIGHT && currentText <= MAX_WEIGHT {
                    sender.text = String(currentText)
                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.green.cgColor
                } else {
                    sleep(1) // 자기만.족!
                    sender.text = nil
                    sender.placeholder = "지정된 범위를 벗어 났습니다."
                    sender.layer.borderWidth = 2
                    sender.layer.borderColor = UIColor.red.cgColor
                }
            }
            
        }
    }
    
    // heightTextField, weightTextField 둘다 연결
    @IBAction func editingTextfieldInit(_ sender: UITextField) {
        // 다시 입력하면, 초기화
        sender.placeholder = nil
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func calculationBmiButton(_ sender: UIButton) {
    }
    
    
    @IBAction func kebordHide(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK :- Function
    func bmiCalculator(height h : Double, weight w: Double) -> Double {
        let bmiValue = w / (h * h)
        
        return bmiValue
    }
}
























// Alert
////Object-C 함수
//@objc func rightBarButtonClicked() {
//    print("BarButton Clicked!!")
//    
//    //1. 컨텐츠
//    let alert = UIAlertController(title: "기념일 저장", message: "날짜를 저장하시겠습니까?", preferredStyle: .actionSheet)
//    
//    //2. 버튼
//    let firstButton = UIAlertAction(title: "버튼1", style: .cancel)
//    let secondButton = UIAlertAction(title: "버튼2", style: .destructive)
//    let thirdButton = UIAlertAction(title: "버튼3", style: .default)
//    let fourthButton = UIAlertAction(title: "버튼4", style: .default)
//    
//    //3. 컨텐츠 + 버튼
//    alert.addAction(firstButton)
//    alert.addAction(secondButton)
//    alert.addAction(thirdButton)
//    alert.addAction(fourthButton)
//    
//    //4. 띄우기
//    present(alert, animated: true)
//    
//}
