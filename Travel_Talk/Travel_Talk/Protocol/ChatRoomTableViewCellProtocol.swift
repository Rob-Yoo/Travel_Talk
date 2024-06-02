//
//  ChatRoomTableViewCellProtocol.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import UIKit

protocol ChatRoomTableViewCellProtocol: UITableViewCellProtocol {
    var profileImageViews: [UIImageView]! { get set }
    var nameLabel: UILabel! { get set }
    var recentMessageLabel: UILabel! { get set }
    var dateLabel: UILabel! { get set }
    var chatRoomInfo: ChatRoom { get set }
}

extension ChatRoomTableViewCellProtocol {
    
    func configureProfileImageViews(cornerRadius: CGFloat) {
        self.profileImageViews.forEach {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = cornerRadius
            $0.clipsToBounds = true
            $0.layer.borderWidth = 0.3
            $0.layer.borderColor = UIColor.lightGray.cgColor
        }
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
    
    func configureChatRoomCellData() {
        let images = self.chatRoomInfo.chatroomImage.map { UIImage(named: $0) }
        let name = self.chatRoomInfo.chatroomName
        let recentChat = self.chatRoomInfo.recentChat
        let recentMessage = recentChat?.message
        let date = recentChat?.date.formatDate(inputDateFormat: "yyyy-MM-dd HH:mm", outputDateFormat: "yy.MM.dd")
        
        for (profileImageViewCount, imageView) in self.profileImageViews.enumerated() {
            if (profileImageViewCount >= images.count) {
                imageView.layer.borderColor = UIColor.clear.cgColor
            } else {
                imageView.image = images[profileImageViewCount]
            }
        }
        
        self.nameLabel.text = name
        self.recentMessageLabel.text = recentMessage
        self.dateLabel.text = date
    }
}
