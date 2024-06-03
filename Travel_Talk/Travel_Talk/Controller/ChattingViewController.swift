//
//  ChattingViewController.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/3/24.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet var messageTextFieldContainerView: UIView!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureMessageTextFieldContainerView()
    }
}

extension ChattingViewController {
    private func configureMessageTextFieldContainerView() {
        self.messageTextFieldContainerView.layer.cornerRadius = 10
        self.messageTextField.borderStyle = .none
        self.messageTextField.textColor = .black
        self.messageTextField.attributedPlaceholder = NSAttributedString(string: "메세지를 입력하세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.sendButton.tintColor = .lightGray
    }
}
