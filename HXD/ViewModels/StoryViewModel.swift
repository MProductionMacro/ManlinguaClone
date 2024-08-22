//
//  StoryViewModel.swift
//  HXD
//
//  Created by Rama Eka Hartono on 19/08/24.
//

import SwiftUI
import Combine

class StoryViewModel: ObservableObject {
    @Published var stories: [Story] = []
    @Published var currentStoryIndex = 0
    @Published var currentStage: StoryStage = .onboarding
    @Published var currentPage: Page = .story
    @Published var currentOnboardingIndex = 0
    @Published var currentFlashcardIndex = 0
    @Published var currentQuiz1Index = 0
    @Published var currentQuiz2Index = 0
    @Published var currentToneTestIndex = 0
    @Published var currentConversationIndex = 0
    @Published var currentConversationIndex2 = 0
    @Published var quizView: String = "Quiz"
    @Published var quizView2: String = "Quiz"
    @Published var toneView: String = "Quiz"
    @Published var convView: String = "Quiz"
    @Published var recall: String = "Home"
    @Published var showChoice: Bool = true
    
    enum StoryStage {
        case onboarding
        case flashcard
        case quiz1
        case quiz2
        case toneTest
        case conversation
        case completed
    }
    
    enum Page {
        case home
        case story
    }
    
    var currentStory: Story {
        stories[currentStoryIndex]
    }
    
    func setcurrentStory(index: Int) {
        stories[index]
    }
    
    // Method to move to the next stage or story
    func moveToNextStage() {
        switch currentStage {
        case .onboarding:
            if currentOnboardingIndex < currentStory.onboarding.count - 1 {
                currentOnboardingIndex += 1
            } else {
                currentStage = .flashcard
                currentOnboardingIndex = 0
            }
        case .flashcard:
            quizView = "Quiz"
            currentStage = .quiz1
        case .quiz1:
            quizView2 = "Quiz"
            currentStage = .quiz2
        case .quiz2:
            toneView = "Quiz"
            currentStage = .toneTest
        case .toneTest:
            currentStage = .conversation
            if currentStoryIndex < stories.count - 1 {
//
            } else {
                currentPage = .home
            }
        case .conversation:
            if currentConversationIndex < currentStory.conversation.count - 1 {
                currentConversationIndex += 1
                currentConversationIndex2 += 1
            } else {
                currentStage = .completed
                currentConversationIndex = 0
                currentConversationIndex2 = 0
                if currentStoryIndex < stories.count - 1 {
                    currentStoryIndex += 1
                    currentStage = .onboarding
                } else {
//
                }
            }
        case .completed:
            break
        }
    }
    
    init() {
        loadStories()
        print(stories)
    }
    
    func loadStories() {
        // Locate the JSON file in the bundle
        guard let url = Bundle.main.url(forResource: "quizpage", withExtension: "json") else {
            print("File not found")
            return
        }
        
        do {
            // Load and decode the JSON data
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.stories = try decoder.decode([Story].self, from: data)
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
}
