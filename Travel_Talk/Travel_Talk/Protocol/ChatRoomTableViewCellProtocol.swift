//
//  ChatRoomTableViewCellProtocol.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import UIKit

protocol ChatRoomTableViewCellProtocol: UITableViewCellProtocol {
    var nameLabel: UILabel! { get set }
    var recentMessageLabel: UILabel! { get set }
    var dateLabel: UILabel! { get set }
    var chatRoomInfo: ChatRoom! { get set }
}

extension ChatRoomTableViewCellProtocol {
    
    func configureProfileImageView(imageView: UIImageView, cornerRadius: CGFloat) {
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.3
        imageView.layer.borderColor = UIColor.lightGray.cgColor
    }

    func configureNameLabel() {
        self.nameLabel.textColor = .black
        self.nameLabel.textAlignment = .left
        self.nameLabel.numberOfLines = 1
        self.nameLabel.font = .boldSystemFont(ofSize: 15)
    }
    
    func configureRecentMessageLabel() {
        self.recentMessageLabel.textAlignment = .left
        self.recentMessageLabel.textColor = .lightGray
        self.recentMessageLabel.numberOfLines = 2
        self.recentMessageLabel.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    func configureDateLabel() {
        self.dateLabel.textColor = .lightGray
        self.dateLabel.font = .systemFont(ofSize: 11)
    }
}
