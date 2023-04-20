//
//  NavigationViewUsage.swift
//  WeSplit
//
//  Created by ömer türkmen on 19.04.2023.
//

import SwiftUI

struct NavigationViewUsage: View {
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Text("Hello World")
                }
            }
            .navigationTitle("Swift UI")
            
            ///This move title to middle
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigationViewUsage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewUsage()
    }
}


//Forms
///Forms are scrolling lists of static controls like text and images, but can also include user interactive controls like text fields, toggle switches, buttons, and more.
///We can add 10 rows not 11. This is the limit for form. If we want to add more, we need to send them in Group

//Section
///If you want your form to look different when splitting items into chunks, you should use the Section view instead. This splits your form into discrete visual groups, with white space between other components
