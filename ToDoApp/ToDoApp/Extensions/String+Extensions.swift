//
//  String+Extensions.swift
//  ToDoApp
//
//  Created by Salman_Macbook on 04/07/24.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
