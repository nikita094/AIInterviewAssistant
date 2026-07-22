//
//  APIClient.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

protocol APIClientProtocol {
    
    func send<T: Decodable>(
        request: URLRequest
    ) async throws -> T
    
}


final class APIClient: APIClientProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    
    func send<T: Decodable>(
        request: URLRequest
    ) async throws -> T {
        
        do {
            
            let (data, response) = try await session.data(for: request)
            
            print(String(data: data, encoding: .utf8) ?? "")
            
            try validate(response)
            
            return try decode(data)
            
        } catch {
            
            throw ErrorMapper.map(error)
            
        }
        
    }
    
}
private extension APIClient {
    
    func decode<T: Decodable>(
        _ data: Data
    ) throws -> T {
        
        do {
            
            return try JSONDecoder().decode(
                T.self,
                from: data
            )
            
        } catch {
            
            throw APIError.decodingFailed
            
        }
        
    }
    
}
private extension APIClient {
    
    func validate(_ response: URLResponse) throws {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            
            throw APIError.invalidResponse
            
        }
        
        switch httpResponse.statusCode {
            
        case 200...299:
            return
            
        case 401:
            throw APIError.unauthorized
            
        case 403:
            throw APIError.forbidden
            
        case 404:
            throw APIError.notFound
            
        case 429:
            throw APIError.rateLimited
            
        case 500...599:
            throw APIError.serverError
            
        default:
            throw APIError.requestFailed(httpResponse.statusCode)
            
        }
        
    }
    
}
