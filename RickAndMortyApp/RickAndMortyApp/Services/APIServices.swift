import Foundation

class APIService {
    func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedResponse.results)
                }
            } catch {
                print("Decoding error: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume()
    }
}
