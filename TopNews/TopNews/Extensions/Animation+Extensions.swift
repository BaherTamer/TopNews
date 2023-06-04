//
//  Animation+Extensions.swift
//  TopNews
//
//  Created by Baher Tamer on 02/06/2023.
//

import SwiftUI

extension Animation {
    static var newsCardAnimation: Animation {
        .interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)
    }
}
