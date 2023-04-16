//
//  Decodable+Extentions.swift
//  English Premier League
//
//  Created by Yehia Samak on 11/04/2023.
//

import Foundation

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}
