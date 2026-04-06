import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false

    private let apiService = APIService()

    func fetchCharacters() {
        isLoading = true

        apiService.fetchCharacters { [weak self] characters in
            self?.characters = characters
            self?.isLoading = false
        }
    }
}
