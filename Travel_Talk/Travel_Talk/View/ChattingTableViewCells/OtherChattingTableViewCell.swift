//
//  OtherChattingTableViewCell.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/3/24.
//

import UIKit

class OtherChattingTableViewCell: UITableViewCell, ChattingTableViewCellProtocol {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var chat: Chat? {
        didSet {
            self.configureCellData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureProfileImageView()
        self.configureNameLabel()
        self.configureMessageLabel()
        self.configureDateLabel()
    }
    
}

extension OtherChattingTableViewCell {
    private func configureProfileImageView() {
        let cornerRadius = self.profileImageView.frame.width / 2

        self.profileImageView.layer.cornerRadius = cornerRadius
        self.profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.profileImageView.layer.borderWidth = 0.7
    }
    
    private func configureNameLabel() {
        self.nameLabel.textColor = .black
        self.nameLabel.font = .systemFont(ofSize: 10)
    }
    
    private func configureCellData() {
        guard let chat = self.chat else { return }
        
        self.profileImageView.image = UIImage(named: chat.user.profileImage)
        self.nameLabel.text = chat.user.rawValue
        self.messageLabel.text = chat.message
        self.dateLabel.text = chat.date.formatDate(inputDateFormat: "yyyy-MM-dd HH:mm", outputDateFormat: "hh:mm a", isKorean: true)
    }
}
