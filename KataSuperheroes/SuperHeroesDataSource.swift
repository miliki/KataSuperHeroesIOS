import Result

protocol SuperHeroesDataSource
{
    func getAll(completion: @escaping (Result<SuperHeroes, CustomError>) -> Void)
}
