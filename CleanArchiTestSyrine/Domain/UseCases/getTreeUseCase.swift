//
//  getTreeUseCase.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 21/06/2023.
//

import Foundation

protocol GetTrees {
    func execute() async -> Result<[RecordModel], HTTPError>
}

import Foundation


struct GetTreeUseCase: GetTrees {
    var repo: TreesRepository
    
    func execute() async -> Result<[RecordModel], HTTPError> {
        do{
            let trees = try await repo.getTrees()
            return .success(trees)
        }catch(let error){
            return .failure(error as! HTTPError)
        }
    }
}
