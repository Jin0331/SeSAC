//
//  Papago.swift
//  SeSAC4Network
//
//  Created by jack on 2024/01/18.
//

import Foundation

struct Papago: Codable {
    let message: PapagoResult
}

struct PapagoResult: Codable {
    let result: PapagoFinal
}

struct PapagoFinal: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}
