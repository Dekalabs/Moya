//
//  ValidationContentType.swift
//  Moya
//
//  Created by Roberto Broseta Vigara on 04/09/2020.
//

import Foundation

/// Represents the status codes to validate through Alamofire.
public enum ValidationContentType {

    /// No validation.
    case none

    /// Validate only the given status codes.
    case customTypes([String])

    /// The list of HTTP status codes to validate.
    var contentTypes: [String] {
        switch self {
        case .customTypes(let contentTypes):
            return contentTypes
        case .none:
            return []
        }
    }
}

extension ValidationContentType: Equatable {

    public static func == (lhs: ValidationContentType, rhs: ValidationContentType) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.customTypes(let contents1), .customTypes(let contents2)):
            return contents1 == contents2
        default:
            return false
        }
    }
}
