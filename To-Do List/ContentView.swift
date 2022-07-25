//
//  ContentView.swift
//  To-Do List
//
//  Created by Ali on 25/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var ToDoItems =
    [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()), ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()), ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(ToDoItem) {item in
                    Text(item.description)
                }
                .onMove{ indices, newOffset in
                    toDoItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    toDoItems.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("To Do List")
            .navigationBarItems(leading: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ToDoItem: Identifiable {
    var id = UUID()
    var priotory = String()
    var descreption = String()
    var dueDate = Date()
}
