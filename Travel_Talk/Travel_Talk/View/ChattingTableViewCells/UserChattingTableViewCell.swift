//
//  UserChattingTableViewCell.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/3/24.
//

import UIKit

class UserChattingTableViewCell: UITableViewCell, ChattingTableViewCellProtocol {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var chat: Chat? {
        didSet {
            self.configureCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureMessageLabel()
        self.configureDateLabel()
    }

    private func configureCellData() {
        guard let chat = self.chat else { return }
        
        self.messageLabel.backgroundColor = .systemGray2
        self.messageLabel.text = chat.message
        self.dateLabel.text = chat.date.formatDate(inputDateFormat: "yyyy-MM-dd HH:mm", outputDateFormat: "hh:mm a", isKorean: true)
    }
}
