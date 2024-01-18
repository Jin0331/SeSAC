//
//  BookTableViewCell.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/18.
//

import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {
 
    @IBOutlet var bookImageView: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        bookImageView.contentMode = .scaleAspectFill
        mainLabel.font = .boldSystemFont(ofSize: 15)
        contentLabel.font = .systemFont(ofSize: 13)
        contentLabel.numberOfLines = 0 
    }
 
    func configureCell(_ data: Document) {
        mainLabel.text = data.title
        contentLabel.text = data.contents
        bookImageView.kf.setImage(with: URL(string: data.thumbnail))
    }
    
}
