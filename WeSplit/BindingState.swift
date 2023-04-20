//
//  BindingState.swift
//  WeSplit
//
//  Created by ömer türkmen on 19.04.2023.
//

import SwiftUI

struct BindingState: View {
    @State private var name = ""
    var body: some View {
        Form{
            TextField("Enter your name", text: $name)
            Text("Hello \(name)")
        }
    }
}

struct BindingState_Previews: PreviewProvider {
    static var previews: some View {
        BindingState()
    }
}


// State Binding
///If we want to display property and also sore we need to use State Binding with '$' dollar sign
///This dollar sign --> differentiates between “show the value of this property here” and “show the value of this property here, but write any changes back to the property.”
///Remember, views are a function of their state – that text field can only show something if it reflects a value stored in your program. What SwiftUI wants is a string property in our struct that can be shown inside the text field, and will also store whatever the user types in the text field.
