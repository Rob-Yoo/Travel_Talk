//
//  ChattingListTableViewCell.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import UIKit

class PersonalChatRoomTableViewCell: UITableViewCell, ChatRoomTableViewCellProtocol {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var recentMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let reusableIdentifier = String(describing: PersonalChatRoomTableViewCell.self)
    var chatRoomInfo: ChatRoom! {
        didSet {
            self.configureChatRoomCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureProfileImageView(imageView: profileImageView, cornerRadius: self.profileImageView.frame.width / 2)
        self.configureNameLabel()
        self.configureRecentMessageLabel()
        self.configureDateLabel()
    }
    
    func configureChatRoomCellData() {
        let image = UIImage(named: self.chatRoomInfo.chatroomImage.first!)
        let name = self.chatRoomInfo?.chatroomName
        let recentChat = self.chatRoomInfo?.recentChat
        let recentMessage = recentChat?.message
        let date = recentChat?.date.formatDate(inputDateFormat: "yyyy-MM-dd HH:mm", outputDateFormat: "yy.MM.dd")
        
        self.profileImageView.image = image
        self.nameLabel.text = name
        self.recentMessageLabel.text = recentMessage
        self.dateLabel.text = date
    }
}
