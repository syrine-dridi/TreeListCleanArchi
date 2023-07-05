//
//  NetworkErrors.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 05/07/2023.
//

import Foundation

import Foundation

public enum HTTPError: LocalizedError {
    
    case badUrl
    case requestError
    case decodingError
    case statusNotOK
    case unknown(Error)

}
