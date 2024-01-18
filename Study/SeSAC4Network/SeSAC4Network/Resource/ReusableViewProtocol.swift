//
//  ReusableViewProtocol.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/18.
//

import UIKit

protocol ReusableViewProtocol {
    static var identifier: String { get }
}
s
extension UITableViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
