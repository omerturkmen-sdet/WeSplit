//
//  TapCount.swift
//  WeSplit
//
//  Created by ömer türkmen on 19.04.2023.
//

import SwiftUI

struct TapCount: View {
    
    ///This code is not valid. This struct might created as constant so it won't let tabCount value to change
//    var tabCount = 0
    
    ///@State allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.
    @State private var tabCount = 0
    var body: some View {
        Button("Count: \(tabCount)"){
            tabCount += 1
        }
    }
}

struct TapCount_Previews: PreviewProvider {
    static var previews: some View {
        TapCount()
    }
}



// State
///Views are a function of their state
///When we say SwiftUI’s views are a function of their state, we mean that the way your user interface looks – the things people can see and what they can interact with – are determined by the state of your program. For example, they can’t tap Continue until they have entered their name in a text field.
