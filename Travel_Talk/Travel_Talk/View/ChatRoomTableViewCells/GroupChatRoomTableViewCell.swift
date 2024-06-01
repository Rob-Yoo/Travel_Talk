//
//  GroupChatRoomTableViewCell.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import UIKit

class GroupChatRoomTableViewCell: UITableViewCell, ChatRoomTableViewCellProtocol {

    @IBOutlet private var profileImageViews: [UIImageView]!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var recentMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static var reusableIdentifier = String(describing: GroupChatRoomTableViewCell.self)
    var chatRoomInfo: ChatRoom! {
        didSet {
            self.configureChatRoomCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureProfileImageViews()
        self.configureNameLabel()
        self.configureRecentMessageLabel()
        self.configureDateLabel()
    }
    
    func configureChatRoomCellData() {
        let images = self.chatRoomInfo.chatroomImage.map { UIImage(named: $0) }
        let name = self.chatRoomInfo.chatroomName
        let recentChat = self.chatRoomInfo.recentChat
        let recentMessage = recentChat?.message
        let date = recentChat?.date.formatDate(inputDateFormat: "yyyy-MM-dd HH:mm", outputDateFormat: "yy.MM.dd")
        
        for (idx, imageView) in self.profileImageViews.enumerated() {
            if (idx >= images.count) {
                imageView.layer.borderColor = UIColor.clear.cgColor
            } else {
                imageView.image = images[idx]
            }
        }
        
        self.nameLabel.text = name
        self.recentMessageLabel.text = recentMessage
        self.dateLabel.text = date
    }
    
    private func configureProfileImageViews() {
        let cornerRadius = self.profileImageViews.first!.frame.width / 3

        self.profileImageViews.forEach { self.configureProfileImageView(imageView: $0, cornerRadius: cornerRadius) }
    }
}
