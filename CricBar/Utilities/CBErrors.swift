//
//  APIError.swift
//  CricBar
//
//  Created by Parshva Shah on 3/27/23.
//

import Foundation

enum CBErrors: Error {
    case invalidURL
    case statusCodeError
    case apiKeyMissing
    case apiHostMissing
}
