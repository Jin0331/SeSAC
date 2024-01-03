//
//  PosterViewController.swift
//  Day1-Assignment
//
//  Created by JinwooLee on 12/27/23.
//

import UIKit

class PosterViewController: UIViewController {
    let posterList = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    @IBOutlet var PosterImageCollection : [UIImageView]!
    @IBOutlet var BadgeCollection : [UIImageView]!
    
    @IBOutlet weak var palyButton: UIButton!
    @IBOutlet weak var pickButton: UIButton!
    
    @IBOutlet weak var StackView1: UIStackView!
    @IBOutlet weak var StackView2: UIStackView!
    @IBOutlet weak var StackView3: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for poster in PosterImageCollection {
            poster.layer.cornerRadius = 15
        }
    
        palyButton.layer.cornerRadius = 10
        pickButton.layer.cornerRadius = 10
        
        // 시작부터 랜덤
        stackViewHidden(stackView: StackView1)
        stackViewHidden(stackView: StackView2)
        stackViewHidden(stackView: StackView3)
        
        randBadge()
    }

    @IBAction func resultPosterTabbed(_ sender: UIButton) {
        
        var selectedSet : Set<String> = []
        // 중복되지 않는 값으로 초기화
        while selectedSet.count < 4 {
            selectedSet.insert(posterList.randomElement()!)
        }
        let selectedArray = Array(selectedSet)
        
        for index in 0...PosterImageCollection.count - 1 {
            PosterImageCollection[index].image = UIImage(named: selectedArray[index])
        }
        
        // 버튼을 눌렀을 때, 랜덤으로 변경
        stackViewHidden(stackView: StackView1)
        stackViewHidden(stackView: StackView2)
        stackViewHidden(stackView: StackView3)
        
        randBadge()
        
    }
    
    // stackView의 subView 별로 탐색하면서 랜덤으로 hidden 조절
    func stackViewHidden(stackView stack : UIStackView){
        
        for subview in stack.subviews {
            subview.isHidden = Bool.random()
        }
    }

    func randBadge() {
        for badge in BadgeCollection {
            badge.isHidden = Bool.random()
        }
    }
    
}
