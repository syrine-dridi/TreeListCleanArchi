//
//  getTreeUseCase.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 21/06/2023.
//

import Foundation

enum UseCaseError: Error{
    case networkError, decodingError
}

protocol GetTrees {
    func execute() async -> Result<[RecordModel], UseCaseError>
}

import Foundation


struct GetTreeUseCase: GetTrees {
    var repo: TreesRepository
    
    func execute() async -> Result<[RecordModel], UseCaseError> {
        do{
            let trees = try await repo.getTrees()
            return .success(trees)
        }catch(let error){
            switch(error){
            case APIServiceError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
