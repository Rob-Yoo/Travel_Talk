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
    
    private let rawChattingList = mockChatList
    private lazy var searchResultChattingList = self.rawChattingList {
        didSet {
            self.chattingListTableView.reloadData()
        }
    }

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

// MARK: - UITableView Handling
extension ChattingListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResultChattingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatRoom = self.searchResultChattingList[indexPath.row]
        
        guard let chattingListCell = tableView.dequeueReusableCell(withIdentifier: ChattingListTableViewCell.reusableIdentifier, for: indexPath) as? ChattingListTableViewCell else {
            return UITableViewCell()
        }
        
        chattingListCell.configureCellData(data: chatRoom)
        return chattingListCell
    }
    
}

// MARK: - UISearchBar Handling
extension ChattingListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let result = self.rawChattingList.filter {
            let lowercasedChatRoomName = $0.chatroomName.lowercased()
            let lowercasedSearchText = searchText.lowercased()
            
            return lowercasedChatRoomName.contains(lowercasedSearchText)
        }
        
        self.searchResultChattingList = (searchText.isEmpty) ? self.rawChattingList : result
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}

