//
//  TreeRepository.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 20/06/2023.
//

import Foundation

protocol TreesRepository {
    func getTrees() async throws -> [RecordModel]
}
