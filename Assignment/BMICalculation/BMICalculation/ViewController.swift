//
//  ViewController.swift
//  BMICalculation
//
//  Created by JinwooLee on 1/3/24.
//

/*
 이번 과제는 파고들면 파고들 수록 어려워지는 과제(?).. 간단하게 생각하면 금방 할 것 같다.
 (1) label, image 등 시각적인 요소는 xcode에서 inspector를 통해 작업 (이번 과제는 로직이 중요함)
 (2) UITextField는 sender로 String Type이 들어온다
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
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // View 관련
        designTextfield(textField: heightTextField)
        designTextfield(textField: weightTextField)
        resultButton.layer.cornerRadius = 15
        
        // 로직 관련
        heightTextField.tag = 0 // 키 textfield의 tag 0
        weightTextField.tag = 1 // 키 textfield의 tag 1
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
                    sender.layer.borderColor = UIColor.green.cgColor
                } else if currentText >= MIN_HEIGHT && currentText <= MAX_HEIGHT  { // 사용자가 m 기준으로 입력했을 때. 정상 범위
                    sender.text = String(currentText)
                    sender.layer.borderColor = UIColor.green.cgColor
                    
                } else {
                    sleep(1) // 자기만.족!
                    sender.text = nil
//                    sender.placeholder = "지정된 범위를 벗어 났습니다."
                    //https://stackoverflow.com/questions/1340224/iphone-uitextfield-change-placeholder-text-color
                    sender.attributedPlaceholder = NSAttributedString(string: "지정된 범위를 벗어 났습니다", attributes: [.foregroundColor: UIColor.red])
                    sender.layer.borderColor = UIColor.red.cgColor
                }
            } else {
                // nil. 즉, 문자 또는 공백 등 특수문자~
                sleep(1)
                sender.text = nil
//                sender.placeholder = "숫자를 입력해주세요."
                sender.attributedPlaceholder = NSAttributedString(string: "숫자를 입력해주세요", attributes: [.foregroundColor: UIColor.red])
                sender.layer.borderColor = UIColor.red.cgColor
            }
            // tag == 1. weight 판단
        } else if sender.tag == 1 { // weight
            if let currentText { //몸무게는 반드시 kg 단위로 들어오겠지?
                if currentText >= MIN_WEIGHT && currentText <= MAX_WEIGHT {
                    sender.text = String(currentText)
                    sender.layer.borderColor = UIColor.green.cgColor
                } else {
                    sleep(1) // 자기만.족!
                    sender.text = nil
//                    sender.placeholder = "지정된 범위를 벗어 났습니다."
                    sender.attributedPlaceholder = NSAttributedString(string: "지정된 범위를 벗어 났습니다", attributes: [.foregroundColor: UIColor.red])
                    sender.layer.borderColor = UIColor.red.cgColor
                }
            } else {
                // nil. 즉, 문자 또는 공백 등 특수문자~
                sleep(1)
                sender.text = nil
//                sender.placeholder = "숫자를 입력해주세요."
                sender.attributedPlaceholder = NSAttributedString(string: "숫자를 입력해주세요", attributes: [.foregroundColor: UIColor.red])
                sender.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    // heightTextField, weightTextField 둘다 연결
    @IBAction func editingTextfieldInit(_ sender: UITextField) {
        // 다시 입력하면, 초기화
        sender.placeholder = nil
        sender.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func calculationBmiButton(_ sender: UIButton) {
        let h : Double? = Double(heightTextField.text!)
        let w : Double? = Double(weightTextField.text!)
        let bmiOriginalValue : Double! // nil이 아닌 상태에서 들어오기 떄문에 반드시 nil이 아니다!
        let bmiStringValue : String!
        
        print("height - \(h), weight - \(w)") // height 또는 weight든 지정된 범위 밖의 값이 들어올 경우 nil로 들어옴
        
        // height, weight 둘다 nil이 아닐 경우
        if let h, let w { //let str = String(format: "%.2f", PI)
            bmiOriginalValue = bmiCalculator(height: h, weight: w)
            bmiStringValue = bmiCase(bmi: bmiOriginalValue)
            print("bmi original value - \(bmiOriginalValue), bmi string value  - \(bmiStringValue)")
            
            let alert = UIAlertController(title: "BMI 계산 결과", message: "\(String(format:"%.2f", bmiOriginalValue)) -  \(bmiStringValue!)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            present(alert, animated: true)
            
        } else  { // 둘 중 하나가 nil일 경우
            let alert = UIAlertController(title: "BMI를 계산할 수 없습니다!!!", message: "키와 몸무게 입력값을 다시 확인해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            present(alert, animated: true)
        }
    }
    
    @IBAction func rnadomTextfield(_ sender: UIButton) {
        // MAX_*를 이용해서 *_TextField에 바로 접근하기 떄문에, 간단하다
        // 소수점 제한은 걸어야 할 듯
        // 완료 border 포함
        heightTextField.layer.borderColor = UIColor.green.cgColor
        weightTextField.layer.borderColor = UIColor.green.cgColor

        heightTextField.text = String(format:"%.2f", Double.random(in: MIN_HEIGHT...MAX_HEIGHT))
        weightTextField.text = String(format:"%.2f", Double.random(in: MIN_WEIGHT...MAX_WEIGHT))
    }
    
    @IBAction func kebordHide(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    // 비밀번호.. hide..... https://stackoverflow.com/questions/37873119/how-to-toggle-a-uitextfield-secure-text-entry-hide-password-in-swift 참고
    @IBAction func passwordSecure(_ sender: UIButton) {
        weightTextField.isSecureTextEntry.toggle()
        weightTextField.isSelected.toggle()
    }
    
    // MARK :- Function
    func designTextfield(textField tf : UITextField) {
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1.1
        tf.textAlignment = .center
        tf.keyboardType = .decimalPad
    }
    
    func bmiCalculator(height h : Double, weight w: Double) -> Double {
        let bmiValue = w / (h * h)
        
        return bmiValue
    }
    
    func bmiCase(bmi : Double) -> String {

        switch bmi {
        case 0..<18.5:
            return ("저체중")
        case 18.5..<25:
            return ("정상")
        case 25...29.9:
            return ("과체중")
        case 30...:
            return ("비만")
        default:
            return "잘못된 입력값 입니다" // this is to shut up the compiler
        }
    }
}
