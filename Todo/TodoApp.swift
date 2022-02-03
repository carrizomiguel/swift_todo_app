//
//  TodoApp.swift
//  Todo
//
//  Created by carrizane on 2/1/22.
//

import SwiftUI

@main
struct TodoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
