//
//  ContentView.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 2/26/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var notes: [Note] 

    @State private var newNoteTitle: String = ""
    @State private var newNoteContent: String = ""
    @State private var isAddingNote = false // this tracks if input fields are visible

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notes) { note in
                        NavigationLink(destination: NoteDetailView(note: note)) {
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.timestamp, style: .date)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteNotes) // Enables Swipe-to-Delete
                }
                .navigationTitle("Swift Notes")
                .toolbar {
                    #if os(iOS)
                    ToolbarItem(placement: .navigationBarTrailing){
                        EditButton() //Adds an "Edit" Button to delete multiple notes
                    }
                    #endif
                }
                
                Spacer()
                
                if isAddingNote{
                    // Add new note UI
                    VStack (alignment: .leading, spacing: 16){
                        TextField("Title", text: $newNoteTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        Spacer().frame(height: 10)
                        
                        ZStack(alignment: .topLeading) {
                            if newNoteContent.isEmpty {
                                Text("Write your note here...")
                                    .foregroundColor(.gray)
                                    .padding(.top, -28)
                                    .padding(.leading, 12)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .allowsHitTesting(false)
                            }
                            
                            TextEditor(text: $newNoteContent)
                                .frame(height: 120)
                                .padding(.horizontal, 6)
                                .padding(.top, 6)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        HStack {
                            Button(action: {
                                isAddingNote = false // Hides input fields
                                newNoteTitle = ""
                                newNoteContent = ""
                                
                            }){
                                Label("Cancel", systemImage: "xmark.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                
                            }
                            .padding()
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Spacer()
                            
                            Button(action: addNote){
                                Label("Add Note", systemImage: "plus.circle.fill")
                                            .font(.title3)
                                            .foregroundColor(.white)
                            }
                            .padding()
                            .buttonStyle(.borderedProminent)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                    }
                    .padding()
                    .transition(.move(edge: .bottom))
                } else{
                    //Show only the add button initially
                    Button(action:{
                        withAnimation{
                            isAddingNote = true
                        }
                    }){
                        Label("Add note", systemImage: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    .padding()
                    .transition(.opacity)
                }
            }
        }
    }

    private func addNote() {
        guard !newNoteTitle.isEmpty, !newNoteContent.isEmpty else { return }

        withAnimation {
            let newNote = Note(title: newNoteTitle, content: newNoteContent)
            modelContext.insert(newNote)
            
            // Clear text fields after adding
            newNoteTitle = ""
            newNoteContent = ""
            isAddingNote = false
        }
    }

    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(notes[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Note.self, inMemory: true)
}
