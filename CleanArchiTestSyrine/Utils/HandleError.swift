//
//  HandleError.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 05/07/2023.
//

import Foundation

class HandleError {
    
    static func checkErrors(error: HTTPError) -> String {
        switch(error){
        case .statusNotOK : return "status not ok"
        case .requestError : return "request error"
        case .badUrl:return "bad url"
        case .decodingError:return "error decoding"
        case .unknown:return "error"
        }
    }
}
