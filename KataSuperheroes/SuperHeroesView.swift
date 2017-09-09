import UIKit

protocol SuperHeroesView: class
{
    func set(dataSource: UITableViewDataSource & UITableViewDelegate)
    func set(title: String)
    func reloadData()
    func registerNib(nib: UINib, reuseIdentifier: String)
}
