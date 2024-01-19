//
//  OnboardingViewController.swift
//  SeSAC4Network
//
//  Created by JinwooLee on 1/19/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startButtonClicked(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey: "UserState")
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
        
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: false)
        
        
    }
    
}
