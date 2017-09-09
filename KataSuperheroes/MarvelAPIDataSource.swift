import MarvelAPIClient
import Result
import BothamNetworking

struct MarvelAPIDataSource
{
    let charactersAPI: CharactersAPIClient
    
    init(charactersAPI: CharactersAPIClient = MarvelAPIClient.charactersAPIClient)
    {
        MarvelAPIClient.configureCredentials(publicKey: "d49cce7a8b4690860a41939600db1e0a", privateKey: "d00c8f4698295444f876bd68a63dd8978f08054d")
        self.charactersAPI = charactersAPI
    }
}

extension MarvelAPIDataSource: SuperHeroesDataSource
{
    func getAll(completion: @escaping (Result<SuperHeroes, CustomError>) -> Void)
    {
        charactersAPI.getAll(offset: 0, limit: 80) { (result) in
            switch result {
            case .success(let superHeroesDTO):
                self.didReceiveCharacters(characters: superHeroesDTO.characters, completion: completion)
            case .failure(let error): self.didFailedRetrievingCharacters(error: error, completion: completion)
            }
        }
    }
    
    private func didReceiveCharacters(characters: [CharacterDTO]?, completion: @escaping (Result<SuperHeroes, CustomError>) -> Void)
    {
        guard let characters = characters else {
            completion(.failure(.notFound))
            return
        }
        
        completion(.success(map(from: characters)))
    }
    
    private func didFailedRetrievingCharacters(error: BothamAPIClientError, completion: @escaping (Result<SuperHeroes, CustomError>) -> Void)
    {
        completion(.failure(.serverError))
    }
    
    private func map(from charactersDTO: [CharacterDTO]) -> SuperHeroes
    {
        let superHeroes = charactersDTO.map { (characterDTO: CharacterDTO) -> SuperHero in
            let image: URL? = characterDTO.thumbnail.flatMap { $0.URL(variant: .landscapeLarge) as? URL}
            return SuperHero(id: characterDTO.id, name: characterDTO.name!, description: characterDTO.description, imageURL: image, isAvenger: true)
        }
        
        return SuperHeroes(superHeroes: superHeroes)
    }
}
