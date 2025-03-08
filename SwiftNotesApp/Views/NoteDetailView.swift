//
//  NoteDetailView.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 2/26/25.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.largeTitle)
                .bold()
            Text(note.content)
                .font(.body)
                .padding(.top, 10)
            Spacer()
        }
        .padding()
        .navigationTitle("Note Details")
    }
}

#Preview {
    NoteDetailView(note: Note(title: "Sample Note", content: "This is a test note."))
}
