//
//  Tip.swift
//  Trekr
//
//  Created by Kelby Mittan on 12/22/20.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}

