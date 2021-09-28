//
//  To_Do_MVVMApp.swift
//  To-Do-MVVM
//
//  Created by Binaya on 26/09/2021.
//

import SwiftUI

@main
struct To_Do_MVVMApp: App {
    
    @StateObject var toDoItemsViewModel = ToDoItemsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView(toDoItemsViewModel: toDoItemsViewModel)
        }
    }
}
