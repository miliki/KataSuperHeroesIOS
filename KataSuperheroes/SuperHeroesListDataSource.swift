import UIKit

class SuperHeroesListDataSource: NSObject
{
    let superHeroes: SuperHeroes
    let cellHeight: CGFloat = 180.0
    
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

extension SuperHeroesListDataSource: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return cellHeight
    }
}
