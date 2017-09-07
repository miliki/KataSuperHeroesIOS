import Result

struct ObtainSuperHeroesUseCase
{
    private let dataSource: SuperHeroesDataSource
    
    init(dataSource: SuperHeroesDataSource = MarvelAPIDataSource())
    {
        self.dataSource = dataSource
    }
    
    func execute(withCompletion completion: @escaping (Result<SuperHeroes, CustomError>) -> Void)
    {
        dataSource.getAll(completion: completion)
    }
}
