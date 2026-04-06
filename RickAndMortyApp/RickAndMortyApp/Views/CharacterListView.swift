import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Characters...")
                } else {
                    List(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CharacterRowView(character: character)
                        }
                    }
                }
            }
            .navigationTitle("Rick & Morty")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    CharacterListView()
}
