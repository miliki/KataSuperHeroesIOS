

class SuperHeroesListPresenter
{
    weak var view: SuperHeroesView!
    
    let obtainSuperHeroesUseCase: ObtainSuperHeroesUseCase
    var dataSource: SuperHeroesListDataSource?
    
    init(obtainSuperHeroesUseCase: ObtainSuperHeroesUseCase)
    {
        self.obtainSuperHeroesUseCase = obtainSuperHeroesUseCase
    }
}

extension SuperHeroesListPresenter: SuperHeroesListPresenterInterface
{
    func viewLoaded()
    {
        obtainSuperHeroesUseCase.execute { (result) in
            switch result {
            case .success(let superHeroes): self.didReceiveHeroes(heroes: superHeroes)
            case .failure(let error): self.didReceiveError(error: error)
            }
        }
    }
    
    private func didReceiveHeroes(heroes: SuperHeroes)
    {
        
    }
    
    private func didReceiveError(error: Error)
    {
        
    }
}
