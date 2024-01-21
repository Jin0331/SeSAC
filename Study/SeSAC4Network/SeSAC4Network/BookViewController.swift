//
//  BookViewController.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/17.
//

import UIKit
import Alamofire


class BookViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var list: Book = Book(documents: [], meta: Meta(isEnd: false, pageableCount: 0, totalCount: 0))
    
    var page = 1
    var isEnd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self // 잊지말아요
        tableView.register(UINib(nibName: BookTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BookTableViewCell.identifier)
        tableView.rowHeight = 80
        searchBar.delegate = self
        
        let button = UIBarButtonItem(title: "처음부터시작하기", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func rightBarButtonItemClicked() {
        // 화면 전환이 아니라, 아예 처음처럼. 앱이 처음 실행한 것 처럼.
        // seceneDelegate window vc rootview
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "OnboardingViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: OnboardingViewController.identifier) as! OnboardingViewController
        let nav = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    func callRequest(text: String) {
        
        //만약 한글 검색이 안된다면 인코딩 처리
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)&size=10&page=\(page)"
        //sadfsaf
        let headers: HTTPHeaders = [
            "Authorization": APIKey.kakao
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: Book.self) { response in
            
            switch response.result {
            case .success(let success):
                
                if self.page == 1 {
                    self.list = success
                } else {
                    self.list.documents.append(contentsOf: success.documents)
                }
                
                self.isEnd = success.meta.isEnd
//                self.list = success //// 여기서 append가 안 되는 상태였음
                self.tableView.reloadData() //
                
            case .failure(let failure):
                print(failure)
            }
            
        }

    }
}

extension BookViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
//        page = 1 // 또는
        self.list.documents.removeAll() // 다 날리기
                
        callRequest(text: searchBar.text!)
    }
    
}

extension BookViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        cell.configureCell(list.documents[indexPath.row])
        return cell
    }
    
    
}

// iOS10 이상
extension BookViewController : UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("Prefetch \(indexPaths)")
        
        for item in indexPaths {
            if list.documents.count - 3 == item.row && isEnd == false {
                page += 1 // page를 증가시킴!!!!!!!!
                callRequest(text: searchBar.text!)
            }
        }
    }
    
    //취소 기능 : 직접 취소하는 기능을 구현해주어야 동작함
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancel \(indexPaths)")
    }
}
