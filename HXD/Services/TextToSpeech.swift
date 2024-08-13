//
//  TextToSpeech.swift
//  HXD
//
//  Created by Ferdinand Jacques on 08/08/24.
//

import AVFoundation

class TextToSpeechServices: TextToSpeechProtocol {
    private let speechSynthesizer = AVSpeechSynthesizer()
    
    func speakRate(text: String, language: String = "zh-CN", rate: Float) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = rate
        speechSynthesizer.speak(utterance)
    }

    func speak(text: String, language: String = "zh-CN") {
        speakRate(text: text, language: language, rate: 0.5)
    }
    
    func speakSlow(text: String, language: String = "zh-CN") {
        speakRate(text: text, language: language, rate: 0)
    }
}
