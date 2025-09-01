//
//  ContentView.swift
//  WordScramble
//
//  Created by Quellon Naicker on 8/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var useWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)        //stops the auto uppercasing of the first letter
                }
                Section{
                    ForEach(useWords, id: \.self){ word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement()
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")
                    }
                }
                Section{
                    Text("Score: \(score)")
                }
            }
            .navigationTitle(rootWord)
            .toolbar{
                Button("Restart", action: startGame)
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)   //runs only when app is launched
            .alert(errorTitle, isPresented: $showingError){
                Button("OK"){ }
            }message: {
                Text(errorMessage)
            }
        }
        
    }
    
    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else{
            return
        }
        guard isOriginal(word: answer) else{
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else{
            wordError(title: "Word not possible", message: "You can't spell that word form \(rootWord) !")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know")
            return
        }
        guard lengthWord(word: answer)else{
            wordError(title: "Word is too short!", message: "Word must be greater than 3 letters")
            return
        }
        
        withAnimation{      //allows that fade and slide in affect when the words are added
            useWords.insert(answer, at: 0)  //this inserts the words to the start of the array
            score = score + 1
        }
        
        newWord = ""
    }
    func startGame(){
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){     //finds url
            if let startWords = try? String(contentsOf: startWordsURL){         //retrieves contains of url
                let allWords = startWords.components(separatedBy: "\n")         //saves contents in array
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }
    func isOriginal(word: String) -> Bool{
        !useWords.contains(word)
    }
    func isPossible(word: String) -> Bool{
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else{
                return false
            }
        }
        return true
    }
    func isReal(word:String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)      //utf16 - is the dictionary used
        let misspellingRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspellingRange.location == NSNotFound
    }
    
    func wordError(title:String, message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    func lengthWord(word:String) -> Bool{
        if(newWord.count <= 3){
            return false
        }else{
            return true
        }
    }
}


#Preview {
    ContentView()
}
