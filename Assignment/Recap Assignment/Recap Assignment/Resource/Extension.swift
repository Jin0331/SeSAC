//
//  Extension.swift
//  Recap Assignment
//
//  Created by JinwooLee on 1/18/24.
//

import UIKit

extension UIViewController : ResuableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell : ResuableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell : ResuableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


// 참고 -> https://kkh0977.tistory.com/1366
extension String {
    // [정규식 수행 실시 : 사용 방법 : let changeData = strData.matchString(_string: strData)]
    func matchString (_string : String) -> String { // 문자열 변경 실시
        let strArr = Array(_string) // 문자열 한글자씩 확인을 위해 배열에 담는다
        
        let pattern = "^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]$" // 정규식 : 한글, 영어, 숫자만 허용 (공백, 특수문자 제거)
        //let pattern = "^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9\\s]$" // 정규식 : 한글, 영어, 숫자, 공백만 허용 (특수문자 제거)
        
        // 문자열 길이가 한개 이상인 경우만 패턴 검사 수행
        var resultString = ""
        if strArr.count > 0 {
            if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
                var index = 0
                while index < strArr.count { // string 문자 하나 마다 개별 정규식 체크
                    let checkString = regex.matches(in: String(strArr[index]), options: [], range: NSRange(location: 0, length: 1))
                    if checkString.count == 0 {
                        index += 1 // 정규식 패턴 외의 문자가 포함된 경우
                    }
                    else { // 정규식 포함 패턴의 문자
                        resultString += String(strArr[index]) // 리턴 문자열에 추가
                        index += 1
                    }
                }
            }
            return resultString
        }
        else {
            return _string // 원본 문자 다시 리턴
        }
    }
}

// 일반 function
extension MainViewController {
    func configureDesign() {
        self.view.backgroundColor = ImageStyle.backgroundColor
        self.navigationController?.navigationBar.barTintColor = ImageStyle.backgroundColor
        mainTableView.backgroundColor = .clear
        mainSearchbar.searchBarStyle = .minimal
        mainSearchbar.barStyle = .black
        mainSearchbar.tintColor = ImageStyle.textColor
        mainSearchbar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        mainEmptyImage.image = ImageStyle.emptyImage
        mainEmptyImage.contentMode = .scaleAspectFit
        mainEmptyLabel.text = "최근 검색어가 없어요!"
        mainEmptyLabel.textAlignment = .center
        mainEmptyLabel.font = ImageStyle.headerFontSize
        mainEmptyLabel.textColor = ImageStyle.textColor
        latestLabel.text = "최근 검색"
        latestLabel.textColor = ImageStyle.textColor
        latestLabel.font = ImageStyle.normalFontSize
        removeButton.setTitle("모두 지우기", for: .normal)
        removeButton.setTitleColor(ImageStyle.pointColor, for: .normal)
        removeButton.titleLabel?.font = ImageStyle.normalFontSize
        removeButton.titleLabel?.textAlignment = .right
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: ImageStyle.textColor]
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
        backBarButtonItem.tintColor = ImageStyle.textColor
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func setEmptyUI() {
        mainTableView.isHidden = searchKeywordList.count == 0 ? true : false
        mainEmptyImage.isHidden = searchKeywordList.count == 0 ? false : true
        mainEmptyLabel.isHidden = searchKeywordList.count == 0 ? false : true
    }
    
    // 화면 전환
    //TODO: - 데이터 전달
    func screenTransition(sendText : String) {
        let sb = UIStoryboard(name: SearchResultController.identifier, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SearchResultController.identifier) as! SearchResultController
        
        vc.searchKeyword = sendText
        navigationController?.pushViewController(vc, animated: true)
    }
}
