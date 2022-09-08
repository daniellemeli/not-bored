//
//  activity.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 06/09/22.
//

import Foundation

struct Activity: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Float
    let key: String
}
