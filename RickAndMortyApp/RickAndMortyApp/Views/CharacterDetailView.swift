import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.top)

                VStack(alignment: .leading, spacing: 12) {
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Status: \(character.status)")
                        .font(.title3)

                    Text("Species: \(character.species)")
                        .font(.title3)

                    Text("Gender: \(character.gender)")
                        .font(.title3)

                    Text("Origin: \(character.origin.name)")
                        .font(.title3)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .padding()
        }
        .navigationTitle("Character Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CharacterDetailView(character: Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            gender: "Male",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            origin: Origin(name: "Earth")
        ))
    }
}
