//
//  UIViewExtension.swift
//  SeSAC4Network
//
//  Created by JinwooLee on 1/23/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title : String, message : String, buttonTitle : String, completionHander : @escaping () -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completionHander()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
}
