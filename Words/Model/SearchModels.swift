//
//  SearchModels.swift
//  Words
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//


import Foundation

// MARK: - SearchResponseElement
struct SearchResponseElement: Codable {
    let id: Int
    let text: String
    let meanings: [Meaning]
}

// MARK: - Meaning
struct Meaning: Codable {
    let id: Int
    let partOfSpeechCode: String
    let translation: Translation
    let previewURL, imageURL, transcription, soundURL: String

    enum CodingKeys: String, CodingKey {
        case id, partOfSpeechCode, translation
        case previewURL = "previewUrl"
        case imageURL = "imageUrl"
        case transcription
        case soundURL = "soundUrl"
    }
}

// MARK: - Translation
struct Translation: Codable {
    let text: String
    let note: String?
}
