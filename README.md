# Hacking With SwiftUI - Edutainment

## Description
The goal of this task is to build an "Edutainment" app for kids to help them practice multiplication table (E.g., "What is 7 X 8?").

## Tasks/Objective
1. The player needs to select which multiplication tables they want to practice. This could be by using Buttons, Steppers, Pickers but it needs to be going from 2 to 12.
2. The player should be able to select how many questions they want to be asked (E.g., 5, 10, 15 or 20).
3. The app should randomly generate as many questions as they asked for, within the difficulty range that was asked.

## What I Learned
With this challenge, there isn't an option to see the teachers version of the app. I had to take what I learn't in the previous projects and find my own way to create "my" version of the app to complete this task.

- I thought this was the perfect scenario to create a Question struct which holds the structure of what a Question contains (randomNumner, multiplicationNumber and answer).
- I was thinking more about when I should be using @State and found it easier (slightly) to visualise how @State works with the rest of the Body property.
- Initially finding a way to show the "Check Answer" button in above the numeric keyboard quite difficult. I feel reading the Apple documentation can be quite confusing and overwhealming. Something here I will continue to work.
- This was a bit out of scope from what I've learnt so far from other projects but using an Enum to get the answer state (Neutral, Correct & Incorrect). When one of the answers is triggered, it will QuestionCard with flash Green or Red (Correct or Incorrect) with Neutral defaulting back to gray (my choosen colour).

## What it looks like
<img width="220" height="478" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-06-14 at 11 41 59" src="https://github.com/user-attachments/assets/bdc8d8de-e7b6-4862-9740-428d47080a28" />
<img width="220" height="478" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-06-14 at 11 42 16" src="https://github.com/user-attachments/assets/6dcca093-e19b-468f-9444-68944b781396" />
<img width="220" height="478" alt="Simulator Screenshot - iPhone 17 Pro Max - 2026-06-14 at 11 42 32" src="https://github.com/user-attachments/assets/b0f10790-4e61-48ee-80e6-e646bc21513a" />

## More/Other Challenges
- I would like to update the UI a bit. It looks very strict and hasn't got much flow.
- More animations would be cool. E.g., A shake animation on the QuestionCard if the player issues an incorrect answer.
- Instead of something to type, it would be cool to drag and drop the numbers into boxes.
- Have a two separate windows. One for the game settings and the other for the actual game.
- Keeping track of the playerScore to challenge the player to beat their score when the next log in.
