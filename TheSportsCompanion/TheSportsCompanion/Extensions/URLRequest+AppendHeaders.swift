//
//  URLRequest+AppendHeaders.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 26/07/2022.
//

import Foundation

extension URLRequest {
    mutating func appendHttpHeaders() {
        self.setValue(Environment.shared.apiHostname, forHTTPHeaderField: "x-rapidapi-host")
        self.setValue(Environment.shared.apiKey, forHTTPHeaderField: "x-apisports-key")
    }
}
