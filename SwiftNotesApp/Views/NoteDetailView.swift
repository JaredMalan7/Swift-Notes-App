//
//  NoteDetailView.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 2/26/25.
//

import SwiftUI
import SwiftData

struct NoteDetailView: View {
    @Bindable var note: Note
    @State private var isEditing = false //Tracks if we are in edit mode
    @State private var tempTitle: String
    @State private var tempContent: String
    
    init(note: Note){
        self.note = note
        _tempTitle = State(initialValue: note.title)
        _tempContent = State(initialValue: note.content)
        
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            if isEditing{
                // This shows editable fields
                TextField("Title", text: $tempTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                ZStack(alignment: .topLeading) {
                    if tempContent.isEmpty {
                        Text("Write your note here...")
                            .foregroundColor(.gray)
                            .padding(.top, -28)
                            .padding(.leading, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .allowsHitTesting(false)
                    }
                    
                    TextEditor(text: $tempContent)
                        .frame(height: 120)
                        .padding(.horizontal, 6)
                        .padding(.top, 6)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
                
                //Buttons for Save & Cancel
                HStack {
                    Button(action: {
                        isEditing = false // Cancel edits
                    }) {
                        Label("Cancel", systemImage: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                    
                    Button(action: {
                        note.title = tempTitle
                        note.content = tempContent
                        isEditing = false
                    }) {
                        Label("Save Changes", systemImage: "checkmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } else {
                Text(note.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                Text(note.timestamp, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Text(note.content)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    isEditing = true
                }) {
                    Label("Edit Note", systemImage: "pencil.circle.fill")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(isEditing ? "Edit Note" : "Note Details")
    }
}

#Preview {
    NoteDetailView(note: Note(title: "Sample Note", content: "This is a test note."))
}
