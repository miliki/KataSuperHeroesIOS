import UIKit

class SuperHeroesListViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    var eventHandler: SuperHeroesListPresenterInterface!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        eventHandler.viewLoaded()
    }
}

extension SuperHeroesListViewController: SuperHeroesView
{
    func set(dataSource: UITableViewDataSource)
    {
        tableView.dataSource = dataSource
    }
}
