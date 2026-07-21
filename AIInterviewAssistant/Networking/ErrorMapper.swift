//
//  ErrorMapper.swift
//  AIInterviewAssistant
//
//  Created by Nikita Kothadiya on 22/07/26.
//

import Foundation

enum ErrorMapper {

    static func map(_ error: Error) -> APIError {

        if let apiError = error as? APIError {
            return apiError
        }

        if let urlError = error as? URLError {

            switch urlError.code {

            case .notConnectedToInternet:
                return .noInternet

            case .timedOut:
                return .timeout

            case .cancelled:
                return .cancelled

            default:
                return .unknown(urlError)
            }

        }

        if error is DecodingError {
            return .decodingFailed
        }

        return .unknown(error)
    }

}
