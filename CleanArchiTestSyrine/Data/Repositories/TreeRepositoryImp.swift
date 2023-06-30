//
//  TreeRepositoryImp.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 20/06/2023.
//

import Foundation

struct TreeRepositoryImpl: TreesRepository {
    
    var dataSource: TreeDataSource
    
    func getTrees() async throws -> [RecordModel] {
        let _trees =  try await dataSource.getTrees()
        return _trees
    }
}
