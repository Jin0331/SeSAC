//
//  ViewController.swift
//  bamin
//
//  Created by JinwooLee on 1/1/24.
//

import UIKit

class BaminViewController: UIViewController {
    
    @IBOutlet var imageCollection : [UIImageView]!
    @IBOutlet weak var iconTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDesign()
        iconTextField.placeholder = "포케? 돈까스? 커리?"
        iconTextField.tintColor = .lightGray
        iconTextField.setIcon(.icons8Search1503)
        
    }
    @IBAction func keybordHide(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func imageDesign () {
        
        for item in imageCollection {
            item.layer.cornerRadius = 13
        }
    }
    

}

extension UITextField {
func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}
