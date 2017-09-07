import UIKit

struct ApplicationAssembler
{
    func assemble(withWindow window: UIWindow)
    {
        let superHeroesListVC = SuperHeroesListViewController()
        let superHeroesListPresenter = SuperHeroesListPresenter(obtainSuperHeroesUseCase: ObtainSuperHeroesUseCase())
        superHeroesListVC.eventHandler = superHeroesListPresenter
        superHeroesListPresenter.view = superHeroesListVC
        
        window.rootViewController = superHeroesListVC
        window.makeKeyAndVisible()
    }
}
