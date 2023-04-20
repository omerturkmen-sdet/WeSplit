//
//  ContentView.swift
//  WeSplit
//
//  Created by ömer türkmen on 19.04.2023.
//


//To refresh canvas enter : Command + Option + P

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [0,10, 15, 20, 25]
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //                    .keyboardType(.numberPad)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(0..<9){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
//                    .pickerStyle(.inline)             // Like form format
//                    .pickerStyle(.menu)               // Opening menu to pick
//                    .pickerStyle(.navigationLink)     // Navigate new view
//                    .pickerStyle(.segmented)          // side by side
//                    .pickerStyle(.wheel)              // scrolling like turning wheel
                    
                } header: {
                    Text("How much tip do you want to leave ?")
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//Forms
///Forms are scrolling lists of static controls like text and images, but can also include user interactive controls like text fields, toggle switches, buttons, and more.
///We can add 10 rows not 11. This is the limit for form. If we want to add more, we need to send them in Group

//Section
///If you want your form to look different when splitting items into chunks, you should use the Section view instead. This splits your form into discrete visual groups, with white space between other components
