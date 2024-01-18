//
//  LottoViewController.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/16.
//

import UIKit


class LottoViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    let manager = LottoAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.callRequest(number: "1102") { value in
            self.dateLabel.text = value
        }
        
    }
    
    @IBAction func textFieldReturnTapped(_ sender: UITextField) {
        //공백이거나, 문자를 입력한 경우에는 통신이 잘 안될 수도 있겠다!
        manager.callRequest(number: numberTextField.text!) { value in
            self.dateLabel.text = value
        }
         
    }
    
}
