//
//  ViewController.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 5/31/24.
//

import UIKit

class ChattingListViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chattingListTableView: UITableView!
    
    private let chattingList = mockChatList

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.searchBar.delegate = self
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: ChattingListTableViewCell.reusableIdentifier, bundle: nil)
        
        self.chattingListTableView.register(nib, forCellReuseIdentifier: ChattingListTableViewCell.reusableIdentifier)
        self.chattingListTableView.delegate = self
        self.chattingListTableView.dataSource = self
        self.chattingListTableView.separatorStyle = .none
    }
    
}

extension ChattingListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chattingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatRoom = self.chattingList[indexPath.row]
        
        guard let recentChat = chatRoom.chatList.last else {
            return UITableViewCell()
        }
        
        guard let chattingListCell = tableView.dequeueReusableCell(withIdentifier: ChattingListTableViewCell.reusableIdentifier, for: indexPath) as? ChattingListTableViewCell else {
            return UITableViewCell()
        }
        
        chattingListCell.configureCellData(data: recentChat)
        return chattingListCell
    }
    
}

extension ChattingListViewController: UISearchBarDelegate {
    
}

