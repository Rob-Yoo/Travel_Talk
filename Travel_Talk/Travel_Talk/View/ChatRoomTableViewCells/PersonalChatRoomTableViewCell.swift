//
//  ChattingListTableViewCell.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import UIKit

class PersonalChatRoomTableViewCell: UITableViewCell, ChatRoomTableViewCellProtocol {
    
    @IBOutlet var profileImageViews: [UIImageView]!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var recentMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    var chatRoomInfo: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [], chatroomName: "") {
        didSet {
            self.configureChatRoomCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imageViewCornerRadius = (self.profileImageViews.first?.frame.width ?? 0) / 2

        self.configureProfileImageViews(cornerRadius: imageViewCornerRadius)
        self.configureNameLabel()
        self.configureRecentMessageLabel()
        self.configureDateLabel()
    }
}
