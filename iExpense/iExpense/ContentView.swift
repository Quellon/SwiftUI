//
//  ContentView.swift
//  iExpense
//
//  Created by Quellon Naicker on 8/21/24.
//
import Observation
import SwiftUI

        
struct ExpenseItem : Identifiable, Codable{     //codeable allows for unarchive and archive instances?? Fact check
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable         //allows for real time changes when using classes instead of states
class Expenses{
    var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}



struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses.items){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                    .onDelete(perform: removeItems)     //only works on a Foreach -> must use foreach within List
                }
                .navigationTitle("iExpense")
                .toolbar{
                    Button("Add Expenses", systemImage: "plus"){
                        showingAddExpense = true
                    }
                }
                .sheet(isPresented: $showingAddExpense){        //this is how it knows when to show the new view
                    AddView(expenses: expenses)
                }
            }
        }
    
        func removeItems(at Offsets: IndexSet){
            expenses.items.remove(atOffsets: Offsets)
        }
    }


#Preview {
    ContentView()
}
