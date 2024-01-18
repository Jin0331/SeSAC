//
//  MarketViewController.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/16.
//

import UIKit
import Alamofire


class MarketViewController: UIViewController {

    @IBOutlet var marketTableView: UITableView!
    
    var list: [Market] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callRequest()
        configureTableView()
    }
    
    func configureTableView() {
        marketTableView.delegate = self
        marketTableView.dataSource = self
    }
    
    func callRequest() {
        
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<501)
            .responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                
                if response.response?.statusCode == 200 {
                    self.list = success
                    self.marketTableView.reloadData()

                } else if response.response?.statusCode == 500 {
                    
                    print("오류가 발생했어요. 잠시 후 다시 시도해주세요.")
                    
                }
                
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    var array = ["공지사항", "자주 묻는 질문", "1:1 문의", "알림 설정", "이용약관"]
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell")!
        
        cell.imageView?.image = UIImage(named: "star")
        cell.textLabel?.text = array[indexPath.row]
        
//        let data = list[indexPath.row]
//        cell.textLabel?.text = data.korean_name
//        cell.detailTextLabel?.text = data.market
        return cell
    }
    
}
