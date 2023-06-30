//
//  TreeDataSourceImpl.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 20/06/2023.
//

import Foundation

enum APIServiceError: Error{
    case badUrl, requestError, decodingError, statusNotOK
}

struct TreeDataSourceImpl: TreeDataSource {
       
    func getTrees() async throws ->  [RecordModel] {
        
        guard let url = URL(string:  "\(Config.baseURL)/records") else{
            throw APIServiceError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw APIServiceError.requestError
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw APIServiceError.statusNotOK
        }
        
        
        guard let result = try? JSONDecoder().decode(RecordsEntity.self, from: data)
        else {
            throw APIServiceError.decodingError
        }
        
        return  result.records.map({item in RecordModel(id: item.record.id, fields: FieldModel(id: item.record.fields.idbase, adresse: item.record.fields.adresse, hauteurenm: item.record.fields.hauteurenm, libellefrancais: item.record.fields.libellefrancais, circonferenceencm: item.record.fields.circonferenceencm, espece: item.record.fields.espece))})
    }
}
