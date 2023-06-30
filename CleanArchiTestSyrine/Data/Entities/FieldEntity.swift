//
//  FieldModel.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 20/06/2023.
//
import Foundation

public struct FieldEntity: Decodable {
    let idbase: Int
    let adresse : String
    let hauteurenm : Int
    let libellefrancais : String
    let circonferenceencm : Int
    let espece : String
}
