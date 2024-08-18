//
//  Utility.swift
//  NewsReaderSwiftUI
//
//  Created by Ganesh Balasaheb Waghmode on 18/08/24.
//

import Foundation

struct Utility {
    
    static func getUrlString(inputString: String?) -> String? {
        guard let inputString = inputString else {
            return inputString
        }
        return inputString == "" ? nil : inputString
    }
}
