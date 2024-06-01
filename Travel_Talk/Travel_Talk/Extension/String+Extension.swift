//
//  String+Extension.swift
//  Travel_Talk
//
//  Created by Jinyoung Yoo on 6/1/24.
//

import Foundation

extension String {
    static let inputFormatter = DateFormatter()
    static let outputFormatter = DateFormatter()

    func formatDate(inputDateFormat: String, outputDateFormat: String) -> String? {
        String.inputFormatter.dateFormat = inputDateFormat
        
        guard let dateString = String.inputFormatter.date(from: self) else {
            return nil
        }
        
        String.outputFormatter.dateFormat = outputDateFormat
        return String.outputFormatter.string(from: dateString)
    }
}

