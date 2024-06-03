//
//  ChattingTableViewCellProtocol.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit

protocol ChattingTableViewCellProtocol {
    var messageLabel: UILabel! { get set }
    var dateLabel: UILabel! { get set }
    var chat: Chat? { get set }
}

extension ChattingTableViewCellProtocol {
    func configureMessageLabel() {
        self.messageLabel.textColor = .black
        self.messageLabel.font = .systemFont(ofSize: 13)
        self.messageLabel.numberOfLines = 0

        self.messageLabel.layer.cornerRadius = 5
        self.messageLabel.clipsToBounds = true
        self.messageLabel.layer.borderColor = UIColor.lightGray.cgColor
        self.messageLabel.layer.borderWidth = 1
    }
    
    func configureDateLabel() {
        self.dateLabel.textColor = .lightGray
        self.dateLabel.font = .systemFont(ofSize: 9)
    }
}
