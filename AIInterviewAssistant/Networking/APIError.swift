//
//  APIError.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

enum APIError: LocalizedError {

    case invalidURL
    case invalidResponse
    case decodingFailed
    case noInternet
    case timeout
    case unauthorized
    case forbidden
    case notFound
    case rateLimited
    case serverError
    case requestFailed(Int)
    case cancelled
    case unknown(Error)

    var errorDescription: String? {

        switch self {

        case .invalidURL:
            return "Invalid URL."

        case .invalidResponse:
            return "Invalid server response."

        case .decodingFailed:
            return "Failed to decode server response."

        case .noInternet:
            return "No internet connection."

        case .timeout:
            return "The request timed out."

        case .unauthorized:
            return "Unauthorized. Please check your API key."

        case .forbidden:
            return "Access denied."

        case .notFound:
            return "Resource not found."

        case .rateLimited:
            return "Too many requests. Please try again later."

        case .serverError:
            return "Server is currently unavailable."

        case .requestFailed(let code):
            return "Request failed with status code \(code)."

        case .cancelled:
            return "Request was cancelled."

        case .unknown(let error):
            return error.localizedDescription
        }

    }

}
