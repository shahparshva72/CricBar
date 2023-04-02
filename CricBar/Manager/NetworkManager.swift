//
//  NetworkManager.swift
//  CricBar
//
//  Created by Parshva Shah on 2/18/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getHeaders() throws -> [String: String] {
        let rapidAPIKeyEnvVar = "X-RapidAPI-Key"
        let rapidAPIHostEnvVar = "X-RapidAPI-Host"
        
        guard let apiKey = ProcessInfo.processInfo.environment[rapidAPIKeyEnvVar] else {
            throw CBErrors.apiKeyMissing
        }
        
        guard let apiHost = ProcessInfo.processInfo.environment[rapidAPIHostEnvVar] else {
            throw CBErrors.apiHostMissing
        }
        
        let headers = [
            rapidAPIKeyEnvVar: apiKey,
            rapidAPIHostEnvVar: apiHost
        ]
        
        return headers
    }
    
    func getLiveMatches() async throws -> LiveMatchesData {
        let urlString = "https://unofficial-cricbuzz.p.rapidapi.com/matches/list?matchState=live"
        guard let url = URL(string: urlString) else {
            throw CBErrors.invalidURL
        }
        
        let headers = try getHeaders()
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw CBErrors.statusCodeError
        }
        
        return try JSONDecoder().decode(LiveMatchesData.self, from: data)
    }
}
