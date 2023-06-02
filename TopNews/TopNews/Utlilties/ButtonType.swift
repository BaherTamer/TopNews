//
//  ButtonType.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import Foundation

enum CardButton {
    case bookmark
    case share
    case dismiss
}

extension CardButton {
    var icon: String {
        switch self {
        case .bookmark:
            return "bookmark"
        case .share:
            return "square.and.arrow.up"
        case .dismiss:
            return "xmark"
        }
    }
}
