//
//  SaveViewController.swift
//  Day1-Assignment
//
//  Created by JinwooLee on 12/28/23.
//

import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = "'나만의 자동 저장' 기능"
        mainLabel.font = .systemFont(ofSize: 25)
        mainLabel.textAlignment = .center
        
        subLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        mainLabel.font = UIFont.systemFont(ofSize: 20.0)
        subLabel.numberOfLines = 3
        subLabel.alpha = 0.7
        subLabel.textAlignment = .center
        
        mainImage.image = UIImage(named: "dummy")
        mainImage.contentMode = .scaleAspectFill
        
        mainButton.setTitle("설정하기", for: .normal)
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.backgroundColor = .blue
        mainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        subButton.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        subButton.setTitleColor(.black, for: .normal)
        subButton.backgroundColor = .white
        subButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }

}
