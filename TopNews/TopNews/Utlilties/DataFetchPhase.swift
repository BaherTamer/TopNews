//
//  DataFetchPhase.swift
//  TopNews
//
//  Created by Baher Tamer on 04/06/2023.
//

import Foundation

enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}
