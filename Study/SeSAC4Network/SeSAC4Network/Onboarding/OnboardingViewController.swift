//
//  OnboardingViewController.swift
//  SeSAC4Network
//
//  Created by JinwooLee on 1/19/24.
//

import UIKit

/*
 1. TimeInterval 60s 이상이어ㅑ 반복 가능
 2. Foreground에서는 알림이 뜨지 않는 것이 Default (옵션 추가해야됨)
   - Foreground에서 알림을 받고 싶다면, Delegate
 3. Identifier는 64개로 제한
 4. 알림센터에 보이고 있는지, 사용자에게 전달되었는 지 알 수 없음. --> 정책적으로 불가능함
 5. 단, 사용자가 알림을 '클릭'했을 때만 확인가능
 */


class OnboardingViewController: UIViewController {

    @IBOutlet var testButton: UIButton!
    @IBOutlet var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        testLabel.font = UIFont(name: "KartriderOTFExtraBold", size: 54)
    }
    
    func configureButton() {
            //iOS15 이상
        
        testButton.configuration = .sesacStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert(title: "삭제", message: "최근 검색어를 삭제하시겠습니까?", buttonTitle: "확인") {
            print("최근 검색어가 삭제되었습니다!")
        }
    }
    

    @IBAction func startButtonClicked(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey: "UserState")
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "mainTabBarController") as! UITabBarController
        
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: false)
        
    }
    @IBAction func notificationButtonClicked(_ sender: UIButton) {
        
        //1. 컨텐츠
        let content = UNMutableNotificationContent()
        content.title = "장바구니 확인해보셨나요?"
        content.body = "찜한 상품을 구매해보세요!!"
        content.badge = 100
        
        
        
        //2. 언제(트리거) - 몇분 몇초 또는 캘린더 또는 위치
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // 시간
        
        var component = DateComponents()
        component.minute = 24
        
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
        
        //3. 요청
        let request = UNNotificationRequest(identifier: "Jack", content: content, trigger: calendarTrigger)
        
        //4. iOS Sytem에 등록
        UNUserNotificationCenter
            .current()
            .add(request)
    }
}
