//
//  ContentView.swift
//  HackingWithSwiftUI-Edutainment
//
//  Created by Michael Jones on 12/06/2026.
//

/*
 TASKS:
 
 1. The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.
 2. The player should be able to select how many questions they want to be asked: 5, 10, or 20.
 3. You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
 4. Start with an App template, then add some state to determine whether the game is active or whether you’re asking for settings.
 5. Generate a range of questions based on the user’s settings.
 6. Show the player how many questions they got correct at the end of the game, then offer to let them play again.
 
 TO INCLUDE?
 1. Steppers
 2. TextField
 3. Buttons
 4. Picker
 
 */


import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let randomNumber: Int
    let multiplicationNumber: Int
    
    var answer: Int {
        return randomNumber * multiplicationNumber
    }
}

struct ContentView: View {
    @FocusState private var keyboardInFocus: Bool
    @State private var isActive = false
    
    @State private var selectedMultiplicationTable = 2
    @State private var selectedNumberOfQuestions = 5
    @State private var questions = [Question]()
    @State private var questionNumber = 0
    @State private var isGameOver = false
    
    /// An enum to represent the three possible states: neutral (black), correct (green) and incorrect (red).
    enum AnswerState {
        case neutral
        case correct
        case incorrect
    }
    @State private var answerState: AnswerState = .neutral
    
    @State private var answer = Int()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ZStack {
                        if isActive {
                            Rectangle()
                                .fill(
                                    answerState == .neutral ? Color.gray : (answerState == .correct ? Color.green : Color.red)
                                )
                                .frame(width: 300, height: 150)
                                .clipShape(.rect(cornerRadius: 20))
                                .padding()
                            
                            Text("\(questions[questionNumber].randomNumber) x \(questions[questionNumber].multiplicationNumber)")
                                .font(.title.bold())
                                .foregroundStyle(.white)
                        }
                    }
                }
                
                VStack {
                    Form {
                        Section("Multiplication Table?") {
                            Stepper("\(selectedMultiplicationTable) times table", value: $selectedMultiplicationTable, in: 2...12, step: 1)
                        }
                        
                        Section("Number of Questions?") {
                            Picker("Number of Questions?", selection: $selectedNumberOfQuestions) {
                                ForEach([5, 10, 15, 20], id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                            Section("Answer") {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(Color(.secondarySystemBackground))
                                        .shadow(radius: 3)
                                        .frame(height: 60)
                                    HStack {
                                        TextField("Answer", value: $answer, format: .number)
                                            .keyboardType(.numberPad)
                                            .multilineTextAlignment(.center)
                                            .focused($keyboardInFocus)
                                    }
                                    .padding(.horizontal)
                                }
                                .padding(.vertical, 4)
                                .toolbar {
                                    ToolbarItem(placement: .keyboard) {
                                        Button("Check Answer") {
                                            check(answer)
                                            keyboardInFocus = false
                                        }
                                    }
                                }
                            }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    if !isActive {
                        Button("Start Game") {
                            newGame(multiplicationNumber: selectedMultiplicationTable, numberOfQuestions: selectedNumberOfQuestions)
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
                }
            }
            .alert("Game Over!", isPresented: $isGameOver) {
                Button("Okay") { }
            } message: {
                Text("Final Score: ??/\(selectedNumberOfQuestions)")
            }
        }
    }
    
    private func newGame(multiplicationNumber: Int, numberOfQuestions: Int) {
        questions = [Question]()
        
        for _ in 1...numberOfQuestions {
            questions.append(Question(randomNumber: Int.random(in: 2...12), multiplicationNumber: multiplicationNumber))
        }
        
        print(questions)
    }
    
    private func resetGame() {
        questions.removeAll()
        isActive = false
    }
    
    private func check(_ userAnswer: Int) {
        if questions[questionNumber].answer == userAnswer {
            answerState = .correct
        } else {
            answerState = .incorrect
        }
        
        // When the answers is checked, sets the colour; after a brief delay, set it back to neutral (black).
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            answerState = .neutral
            guard questionNumber < questions.count - 1 else {
                isGameOver = true
                resetGame()
                return
            }
            
            questionNumber += 1
        }
    }
}

#Preview {
    ContentView()
}
