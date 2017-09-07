import UIKit

class SuperHeroesListDataSource: NSObject
{
    let superHeroes: SuperHeroes
    
    init(superHeroes: SuperHeroes)
    {
        self.superHeroes = superHeroes
    }
}

extension SuperHeroesListDataSource: UITableViewDataSource
{    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SuperHeroesListCell.self), for: indexPath) as! SuperHeroesListCell
        cell.superHero = superHeroes[indexPath.row]
        
        return cell
    }
}
