//
//  ViewController.swift
//  EmotionDiary
//
//  Created by JinwooLee on 1/2/24.
//

/*
 Step1 : 레이아웃 구성
    - StackView안에 StackView(subView)구성
    0) StackView 우선 Autolayout으로 position 잡기.
        -> Alignment Constraint 및 Height 줌.
        -> Alignment=Fill, Distribution=Fill Equally (subView도 동일)
    1) subView에서 row를 잡기 위한 StackView 사용 (Alignment=Fill, Distribution=Fill Equally)
    2) row별로 다시 Button과 Label별로 StackView (Alignment=Fill, axis=Vertical)
    3) OutletCollect이용한 setDesignButton과 setDesignLabel 만들기
      -> Image 불러올 때, index로 가져오되, withRenderingModel 적용해야 됨
    
 
 step2,3 : 감정 버튼 클릭 횟수 표시하기
    0) tag를 이용한 버튼 횟수 표시하기
    1) randomButtonAction IBAction을 모든 button에 연결하고, current tag 획득
    2) Step3는 한 줄로 표현가능
 
 step4??? : navigationitem 우측 버튼에 초기화 버튼 삽입,, 메뉴까지만 ㅋ
 
 */

import UIKit

class ViewController: UIViewController {
    
    // MARK : IBOutler
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet var buttonList : [UIButton]!
    @IBOutlet var labelList : [UILabel]!
    
    let stateList : [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "황당해", "슬퍼해"]
    var cntDict : [Int : Int] = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0] // 컴프리헨션으로 바꿔보자~ 실패
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background
        backgroundImageView.image = #imageLiteral(resourceName: "background 1")
        backgroundImageView.contentMode = .scaleToFill
        
        //navigation
        navigationItem.title = "감정 다이어리"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshDictCount))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        setDesignButton()
        setDesignLabel()
    }

    // MARK : IBAction
    // Step2 function
    @IBAction func randomButtonAction(_ sender: UIButton) {
        let currentTag : Int = sender.tag
        
        print("current Tag : \(currentTag)")
        
//        cntDict[currentTag] = Int.random(in: 0...20) // Step2
        cntDict[currentTag]! += 1 // Step 3
        
        labelList[currentTag].text = "\(stateList[currentTag]) \(cntDict[currentTag]!)"
    }
    
    
    // MARK : Function
    
    func setDesignButton () {
        for index in 0..<buttonList.count {
            print("call setDesignButton : index \(index)")
            
            buttonList[index].configuration = nil
            buttonList[index].setTitle("", for: .normal)
            
            let image = UIImage(named: "slime\(index+1)")?.withRenderingMode(.alwaysOriginal)
            buttonList[index].setImage(image, for: .normal)
        }
    }
    
    func setDesignLabel () {
        for index in 0..<labelList.count {
            print("call setDesignLabel : index \(index)")
            
            labelList[index].text = "\(stateList[index]) \(cntDict[index]!)" // tag별로 0으로 초기화된 Dict 호출. 초기화과정
            labelList[index].font = .boldSystemFont(ofSize: 16)
            labelList[index].textAlignment = .center
        }
    }
    
    @objc func refreshDictCount() {
        print("BarButton")
        
        let alert = UIAlertController(title : "초기화", message: "감정 다이어리를 초기화 하시겠습니까?", preferredStyle: .alert)
        
        let oneButton = UIAlertAction(title: "초기화", style: .default)
        let twoButton = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(oneButton)
        alert.addAction(twoButton)
        
        present(alert, animated: true)
    }
}

