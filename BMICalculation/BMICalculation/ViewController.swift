//
//  ViewController.swift
//  BMICalculation
//
//  Created by JinwooLee on 1/3/24.
//

/*
 (1) label은 변할 수 있는 가능성이 낮기때문에, xcode에서 inspector를 통해 작업
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightTextfield: UITextField!
    @IBOutlet weak var weightTextfield: UITextField!
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
