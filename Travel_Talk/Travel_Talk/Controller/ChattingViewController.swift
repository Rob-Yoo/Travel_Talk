//
//  ChattingViewController.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/3/24.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet var chattingTableView: UITableView!
    @IBOutlet var messageTextFieldContainerView: UIView!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    var chatRoom: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavigationBar()
        self.configureChattingTableView()
        self.configureMessageTextFieldContainerView()
    }

    @IBAction func keyBoardDismiss(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

//MARK: - Configure Subviews
extension ChattingViewController {
    private func configureNavigationBar() {
        let backBtnImage = UIImage(systemName: "chevron.left")
        let backButton = UIBarButtonItem(image: backBtnImage, style: .plain, target: self, action: #selector(backButtonTapped))

        guard let chatRoom = self.chatRoom else { return }
        
        self.navigationItem.title = chatRoom.chatroomName
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func configureChattingTableView() {
        let ucNib = UINib(nibName: UserChattingTableViewCell.reusableIdentifier, bundle: nil)
        let ocNib = UINib(nibName: OtherChattingTableViewCell.reusableIdentifier, bundle: nil)

        self.chattingTableView.estimatedRowHeight = 100
        self.chattingTableView.rowHeight = UITableView.automaticDimension
        self.chattingTableView.delegate = self
        self.chattingTableView.dataSource = self
        self.chattingTableView.register(ucNib, forCellReuseIdentifier: UserChattingTableViewCell.reusableIdentifier)
        self.chattingTableView.register(ocNib, forCellReuseIdentifier: OtherChattingTableViewCell.reusableIdentifier)
        self.chattingTableView.allowsSelection = false
        self.chattingTableView.separatorStyle = .none
    }
    
    private func configureMessageTextFieldContainerView() {
        self.messageTextFieldContainerView.layer.cornerRadius = 10
        self.messageTextField.borderStyle = .none
        self.messageTextField.textColor = .black
        self.messageTextField.attributedPlaceholder = NSAttributedString(string: "메세지를 입력하세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.sendButton.tintColor = .lightGray
    }
}

//MARK: - UITableView Setting
extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let chatRoom = self.chatRoom else { return 0 }
        
        return chatRoom.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatRoom = self.chatRoom else { return UITableViewCell() }
        
        let chat = chatRoom.chatList[indexPath.row]
        let identifier = (chat.user == .user) ? UserChattingTableViewCell.reusableIdentifier : OtherChattingTableViewCell.reusableIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        guard var chattingCell = cell as? ChattingTableViewCellProtocol else { return UITableViewCell() }
        
        chattingCell.chat = chat
        return cell
    }
    
    
}

//MARK: - User Action Handling
extension ChattingViewController {
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
