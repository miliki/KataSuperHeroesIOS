import UIKit


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
        view.registerNib(nib: UINib(nibName: String(describing: SuperHeroesListCell.self), bundle: nil), reuseIdentifier: String(describing: SuperHeroesListCell.self))
        view.set(title: "Kata Super Heroes")
        view.hideMainView()
        view.showLoading()
        
        obtainSuperHeroesUseCase.execute { (result) in
            switch result {
            case .success(let superHeroes): self.didReceiveHeroes(heroes: superHeroes)
            case .failure(let error): self.didReceiveError(error: error)
            }
        }
    }
    
    private func didReceiveHeroes(heroes: SuperHeroes)
    {
        view.hideLoading()
        view.showMainView()
        dataSource = SuperHeroesListDataSource(superHeroes: heroes)
        view.set(dataSource: dataSource!)
        view.reloadData()
    }
    
    private func didReceiveError(error: Error)
    {
        
    }
}
