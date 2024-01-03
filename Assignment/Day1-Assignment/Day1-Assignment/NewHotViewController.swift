//
//  NewHotViewController.swift
//  Day1-Assignment
//
//  Created by JinwooLee on 12/28/23.
//

import UIKit

class NewHotViewController: UIViewController {

    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var hotButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var firstSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designButton(openButton, active: false)
        designButton(hotButton, active: false)
        designButton(topButton, active: false)

    }

    @IBAction func resultOpenTapped(_ sender: UIButton) {
        
        designButton(openButton, active: true)
        designButton(hotButton, active: false)
        designButton(topButton, active: false)
        
        mainLabel.text = "이런! 찾으시는 작품이 없습니다"
        subLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요"
    }
    
    @IBAction func resultHotButton(_ sender: UIButton) {
        
        designButton(openButton, active: false)
        designButton(hotButton, active: true)
        designButton(topButton, active: false)
        
        mainLabel.text = "이런! 인기 콘텐츠가 아직 없습니다"
        subLabel.text = "일주일 뒤에 다시 시도해주세요"
    }
    
    @IBAction func resultTopButton(_ sender: UIButton) {
        
        designButton(openButton, active: false)
        designButton(hotButton, active: false)
        designButton(topButton, active: true)
        
        mainLabel.text = "이런! Top 10 시리즈가 아직 없습니다"
        subLabel.text = "한달 뒤에 다시 시도해주세요"
    }
    
    @IBAction func hideKebord(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    func designButton(_ button : UIButton, active : Bool) {
        
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        
        if active {
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
        } else {
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
        }
    }
    
}
