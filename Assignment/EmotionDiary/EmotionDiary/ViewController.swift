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
 
 ////////// userDefault를 이용한 button 클릭 횟수 저장
 1. viewDidLoad()가 실행될 때, 각 label에 stateList가 지정될 때, UserDefaults.standard.integer 가 실행되도록 수정하였으며, key값은 해당 label의 tag와 String interpolation을 이용함
 2. 핵심 로직
     let newValue = UserDefaults.standard.integer(forKey: "label\(currentTag)") + 1
     labelList[currentTag].text = "\(stateList[currentTag]) \(newValue)"
     UserDefaults.standard.set(newValue, forKey: "label\(currentTag)")
 3. Refresh button과 Alert Action을 이용해서, 초기화 기능 추가 (해당과제에서는 안 해도 되지만, 어차피 해야되는 것이라..!)
 
 */

import UIKit

class ViewController: UIViewController {
    
    // MARK : IBOutler
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet var buttonList : [UIButton]!
    @IBOutlet var labelList : [UILabel]!
    
    let stateList : [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "황당해", "슬퍼해"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background
        backgroundImageView.image = #imageLiteral(resourceName: "background 1")
        backgroundImageView.contentMode = .scaleToFill
        
        //set tag
        setTag(outletCollect: buttonList)
        setTag(outletCollect: labelList)
        
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
        //현재 tag는 label과 button이 동일한 상태로, sender(button)의 tag로 해당 label을 찾을 수 있음
        print("current Tag : \(currentTag)")
        
        // 핵심 로직
        let newValue = UserDefaults.standard.integer(forKey: "label\(currentTag)") + 1
        labelList[currentTag].text = "\(stateList[currentTag]) \(newValue)"
        UserDefaults.standard.set(newValue, forKey: "label\(currentTag)")
    }
    
    
    // MARK : Function
    // function Overloading
    func setTag(outletCollect arr : [UIButton]) {
        for index in 0..<arr.count {
            arr[index].tag = index
        }
    }
    func setTag(outletCollect arr : [UILabel]) {
        for index in 0..<arr.count {
            arr[index].tag = index
        }
    }
        
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
            
            // emotion word만큼 userDefault 초기화. integer타입은 키와 값이 없는 상태에서 반환을 요구하면 입력 key값으로 default 0의 userDefault가 생성됨.
            labelList[index].text = "\(stateList[index]) \(UserDefaults.standard.integer(forKey: "label\(index)"))"
            labelList[index].font = .boldSystemFont(ofSize: 16)
            labelList[index].textAlignment = .center
        }
    }
    
    @objc func refreshDictCount() {
        print("BarButton")
        
        let alert = UIAlertController(title : "초기화", message: "감정 다이어리를 초기화 하시겠습니까?", preferredStyle: .alert)
        
        // alert button의 handler를 사용해서, 초기화를 해야하는 경우 Clouser를 이용하여 UserDefaults.standard.removeObject 호출
        // 및 화면에서 바로 적용하도록, label.text 수정함. 근데, self를 사용하는 이유는???
        let oneButton = UIAlertAction(title: "초기화", style: .default) { (action:UIAlertAction!) in
            for key in UserDefaults.standard.dictionaryRepresentation().keys {
                UserDefaults.standard.removeObject(forKey: key.description)
            }
            for index in 0..<self.labelList.count {
                self.labelList[index].text = "\(self.stateList[index]) \(UserDefaults.standard.integer(forKey: "label\(index)"))"
            }
        }
        let twoButton = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(oneButton)
        alert.addAction(twoButton)
        
        present(alert, animated: true)
    }
}

