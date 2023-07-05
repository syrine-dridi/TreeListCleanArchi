//
//  TreeListViewModel.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 21/06/2023.
//

import Foundation
import UIKit


@MainActor
    class TreeListViewModel : ObservableObject {
        
        let getTreesUseCase = GetTreeUseCase(repo: TreeRepositoryImpl(dataSource: TreeDataSourceImpl()))
        
        @Published var trees: [RecordModel]?
        @Published var errorMessage = ""
        @Published var hasError = false
        
        func getTreeList() async {
            errorMessage = ""
            let result = await getTreesUseCase.execute()
            switch result{
            case .success(let listTree):
                self.trees = listTree
            case .failure(let error):
                self.trees = []
                errorMessage = HandleError.checkErrors(error: error)
                hasError = true
            }
        }
    }
