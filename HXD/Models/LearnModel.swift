//
//  LearnModel.swift
//  HXD
//
//  Created by Rama Eka Hartono on 21/08/24.
//

import Foundation

struct Learn: Codable {
    let pinyinInit: [PinyinInit]
    let pinyinFinal: [PinyinFinal]
    let tone: [Tone]
    
    enum CodingKeys: String, CodingKey {
        case pinyinInit = "pinyininit"
        case pinyinFinal = "pinyinfinal"
        case tone
    }
}

struct PinyinInit: Codable {
    let pinyin: String
    let sound: String
}

struct PinyinFinal: Codable {
    let pinyin: String
    let sound: String
}

struct Tone: Codable {
    let jenis: String
    let desc: String
    let hanzi: String
    let pinyin: String
    let mean: String
    let soundtone: String
}
