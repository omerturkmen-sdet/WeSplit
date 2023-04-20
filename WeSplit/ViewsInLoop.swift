//
//  ViewsInLoop.swift
//  WeSplit
//
//  Created by ömer türkmen on 19.04.2023.
//

import SwiftUI

struct ViewsInLoop: View {
    @State private var nameList = ["Jake Peralta","Amy Santiago"]
    private let studentList = ["Harry","Hermonie","Ron"]
    var body: some View {
        Form {
            Section{
                ForEach(0 ..< 8) {
                    Text("Row \($0)")
                }
            }
            
            Section{
                Picker("Cast for Brooklyn 99", selection: $nameList){
                    ForEach(nameList, id: \.self){
                        Text($0)
                    }
                }
            }
            
            Section{
                ForEach(studentList, id: \.self){
                        Text($0)
                }
            }
        }
        
        
    }
}

struct ViewsInLoop_Previews: PreviewProvider {
    static var previews: some View {
        ViewsInLoop()
    }
}



// For Each
/// ForEach(id: \.self) exists because SwiftUI needs to be able to identify every view on the screen uniquely, so it can detect when things change.
