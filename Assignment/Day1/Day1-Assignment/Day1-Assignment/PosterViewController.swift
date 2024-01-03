//
//  PosterViewController.swift
//  Day1-Assignment
//
//  Created by JinwooLee on 12/27/23.
//

import UIKit

class PosterViewController: UIViewController {
    let posterList = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    @IBOutlet weak var mainPosterImage: UIImageView!
    @IBOutlet weak var thirdPosterImage: UIImageView!
    @IBOutlet weak var secondPosterImage: UIImageView!
    @IBOutlet weak var firstPosterImage: UIImageView!
    
    @IBOutlet weak var palyButton: UIButton!
    @IBOutlet weak var pickButton: UIButton!

    @IBOutlet weak var firstNewserise: UILabel!
    @IBOutlet weak var firstNewepi: UILabel!
    @IBOutlet weak var firstWatching: UILabel!
    
    @IBOutlet weak var secondNewserise: UILabel!
    @IBOutlet weak var secondNewepi: UILabel!
    @IBOutlet weak var secondWatching: UILabel!
    
    @IBOutlet weak var thirdNewserise: UILabel!
    @IBOutlet weak var thirdNewepi: UILabel!
    @IBOutlet weak var thirdWatching: UILabel!
    
    @IBOutlet weak var firstBadge: UIImageView!
    @IBOutlet weak var thirdBadge: UIImageView!
    @IBOutlet weak var secondBadge: UIImageView!
    @IBOutlet weak var mainBadge: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainPosterImage.layer.cornerRadius = 15
        firstPosterImage.layer.cornerRadius = 15
        secondPosterImage.layer.cornerRadius = 15
        thirdPosterImage.layer.cornerRadius = 15
        
        palyButton.layer.cornerRadius = 10
        pickButton.layer.cornerRadius = 10
        
        // 시작부터 랜덤
        firstNewepi.isHidden = Bool.random()
        firstWatching.isHidden = Bool.random()
        firstNewserise.isHidden = Bool.random()
        
        secondNewepi.isHidden = Bool.random()
        secondWatching.isHidden = Bool.random()
        secondNewserise.isHidden = Bool.random()
        
        thirdNewepi.isHidden = Bool.random()
        thirdWatching.isHidden = Bool.random()
        thirdNewserise.isHidden = Bool.random()
        
        firstBadge.isHidden = Bool.random()
        secondBadge.isHidden = Bool.random()
        thirdBadge.isHidden = Bool.random()
        mainBadge.isHidden = Bool.random()
    }

    @IBAction func resultPosterTabbed(_ sender: UIButton) {
        
        var selectedSet : Set<String> = []
        // 중복되지 않는 값으로 초기화
        while selectedSet.count < 4 {
            selectedSet.insert(posterList.randomElement()!)
        }
        
        print(selectedSet)
        
        let selectedArray = Array(selectedSet)
        
        mainPosterImage.image = UIImage(named: selectedArray[0])
        firstPosterImage.image = UIImage(named: selectedArray[1])
        secondPosterImage.image = UIImage(named: selectedArray[2])
        thirdPosterImage.image = UIImage(named: selectedArray[3])
        
        // 버튼을 눌렀을 때, 랜덤으로 변경
        firstNewepi.isHidden = Bool.random()
        firstWatching.isHidden = Bool.random()
        firstNewserise.isHidden = Bool.random()
        
        secondNewepi.isHidden = Bool.random()
        secondWatching.isHidden = Bool.random()
        secondNewserise.isHidden = Bool.random()
        
        thirdNewepi.isHidden = Bool.random()
        thirdWatching.isHidden = Bool.random()
        thirdNewserise.isHidden = Bool.random()
        
        firstBadge.isHidden = Bool.random()
        secondBadge.isHidden = Bool.random()
        thirdBadge.isHidden = Bool.random()
        mainBadge.isHidden = Bool.random()
        
    }
    
}
