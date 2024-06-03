//
//  UITableViewCellProtocol.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import UIKit

protocol ReusableProtocol {
    static var reusableIdentifier: String { get }
}

extension UITableViewCell: ReusableProtocol {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
