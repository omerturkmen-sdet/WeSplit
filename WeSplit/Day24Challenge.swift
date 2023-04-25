//
//  Day24Challenge.swift
//  WeSplit
//
//  Created by ömer türkmen on 25.04.2023.
//


/*
 Challenge:
        Go back to project 1 and use a conditional modifier to change the total amount
        text view to red if the user selects a 0% tip.
 */

import SwiftUI

struct Day24Challenge: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = 0..<101
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople)
        return totalAmount / peopleCount
    }
    
    var totalAmount: Double{
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var dollarFormat: FloatingPointFormatStyle<Double>.Currency {
        let currencyCode = Locale.current.currency?.identifier ?? "USD"
        return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: localCurrency)
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
                    .pickerStyle(.navigationLink)
                    
//                    .pickerStyle(.inline)             // Like form format
//                    .pickerStyle(.menu)               // Opening menu to pick
//                    .pickerStyle(.navigationLink)     // Navigate new view
//                    .pickerStyle(.segmented)          // side by side
//                    .pickerStyle(.wheel)              // scrolling like turning wheel
                    
                } header: {
                    Text("How much tip do you want to leave ?")
                }
                
                Section{
                    Text(totalAmount, format: dollarFormat)
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                } header: {
                    Text("Total amount")
                }
                
                Section{
                    Text(totalPerPerson, format: localCurrency)
                } header: {
                    Text("Amount per person")
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

struct Day24Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Day24Challenge()
    }
}
