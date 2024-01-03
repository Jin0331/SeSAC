//
//  KakaoProfielViewController.swift
//  bamin
//
//  Created by JinwooLee on 1/1/24.
//

import UIKit

class KakaoProfielViewController: UIViewController {
    @IBOutlet weak var mainProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainProfile.layer.cornerRadius = 40

    }

}
