//
//  LearnViewModel.swift
//  HXD
//
//  Created by Rama Eka Hartono on 21/08/24.
//

import SwiftUI
import Combine

class LearnViewModel: ObservableObject {
    @Published var learnData: Learn?
    @Published var pinyinInit: [PinyinInit] = []
    @Published var pinyinFinal: [PinyinFinal] = []
    @Published var tones: [Tone] = []
    @Published var currentStage: pinyinCase = .front

    init() {
        loadLearnData()
        print(learnData)
    }
    
    enum pinyinCase {
        case front
        case initial
        case final
        case tone
    }
    
    func switchStage(to stage: pinyinCase) {
        currentStage = stage
//        print(currentStage)
    }

    // Function to load the Learn data from the JSON file
    private func loadLearnData() {
        // Locate the JSON file in the bundle
        guard let url = Bundle.main.url(forResource: "pinyin", withExtension: "json") else {
            print("File not found")
            return
        }
        
        do {
            // Load and decode the JSON data
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let learn = try decoder.decode(Learn.self, from: data)
            self.learnData = learn
            self.pinyinInit = learn.pinyinInit
            self.pinyinFinal = learn.pinyinFinal
            self.tones = learn.tone
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
}
