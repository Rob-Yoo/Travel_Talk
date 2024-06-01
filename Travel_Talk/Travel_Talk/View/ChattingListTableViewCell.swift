//
//  ChattingListTableViewCell.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import UIKit

class ChattingListTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var recentMessgeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureProfileImageView()
        self.configureNameLabel()
        self.configureRecentMessageLabel()
        self.configureDateLabel()
    }
    
    func configureCellData(data: Chat) {
        let image = UIImage(named: data.user.profileImage)
        let name = data.user.rawValue
        let recentMessage = data.message
        let date = data.date.formatDate(inputDateFormat: "yyyy-MM-dd HH:mm", outputDateFormat: "yy.MM.dd")
        
        self.profileImageView.image = image
        self.nameLabel.text = name
        self.recentMessgeLabel.text = recentMessage
        self.dateLabel.text = date
    }
}

// MARK: - Configure Subviews
extension ChattingListTableViewCell {
    private func configureProfileImageView() {
        let width = self.profileImageView.frame.width
        
        self.profileImageView.contentMode = .scaleAspectFit
        self.profileImageView.layer.cornerRadius = width / 2
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.borderWidth = 0.3
        self.profileImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func configureNameLabel() {
        self.nameLabel.textColor = .black
        self.nameLabel.textAlignment = .left
        self.nameLabel.numberOfLines = 1
        self.nameLabel.font = .boldSystemFont(ofSize: 15)
    }
    
    private func configureRecentMessageLabel() {
        self.recentMessgeLabel.textAlignment = .left
        self.recentMessgeLabel.textColor = .lightGray
        self.recentMessgeLabel.numberOfLines = 2
        self.recentMessgeLabel.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private func configureDateLabel() {
        self.dateLabel.textColor = .lightGray
        self.dateLabel.font = .systemFont(ofSize: 11)
    }
}

extension ChattingListTableViewCell: UITableViewCellProtocol {
    static let reusableIdentifier = String(describing: ChattingListTableViewCell.self)
}
