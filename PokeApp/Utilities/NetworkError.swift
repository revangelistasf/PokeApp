//
//  NetworkErrors.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import Foundation

enum NetworkError: String, Error {
    case invalidResponse = "Invalid response from server. Please try again."
}
