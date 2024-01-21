//
//  SettingViewController.swift
//  Recap Assignment
//
//  Created by JinwooLee on 1/20/24.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var settingTable: UITableView!
    
    let settingList = SettingTable.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureLabel()
        configureTableProtocol()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureLabel()
    }
}

//MARK: - Table View 관련
extension SettingViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureTableProtocol() {
        
        print(SettingTableViewCell.identifier)
        
        let xib = UINib(nibName: SettingTableViewCell.identifier, bundle: nil)
        settingTable.register(xib, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        settingTable.delegate = self
        settingTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = settingTable.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        
        cell.backgroundColor = .darkGray
        cell.selectionStyle = .none
        
        cell.configureDesign(item: settingList[indexPath.row])
        
        return cell
    }
}

//MARK: - normal function
extension SettingViewController {
    func configureDesign() {
        //navigation
        self.view.backgroundColor = ImageStyle.backgroundColor
        self.navigationController?.navigationBar.barTintColor = ImageStyle.backgroundColor
        self.navigationItem.title = "설정"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: ImageStyle.textColor]
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
        backBarButtonItem.tintColor = ImageStyle.textColor
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        // table View 관련
        settingTable.backgroundColor = .clear
        
        // top item
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 10
        backgroundView.backgroundColor = .darkGray
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.layer.frame.width / 2
        profileImage.layer.borderWidth = 2.5
        profileImage.layer.borderColor = ImageStyle.pointColor.cgColor
        
        nicknameLabel.font = ImageStyle.headerFontSize
        nicknameLabel.textColor = ImageStyle.textColor
        
        likeLabel.font = ImageStyle.normalFontSize
        likeLabel.textColor = ImageStyle.textColor
    }
    
    func configureLabel() {
        
        //TODO: - 닉네임 설정되면 바꿔야됨
        nicknameLabel.text = "떠나고 싶은 고래밥"

        // 좋아요 개수 측정
        var likeDictionary = UserDefaultManager.shared.like
        var likeCount = likeDictionary.values.filter{$0 == true}.count
        likeLabel.text = "\(likeCount)개의 상품을 좋아하고 있어요!"
    }
}
