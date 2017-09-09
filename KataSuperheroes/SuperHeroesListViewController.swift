import UIKit

class SuperHeroesListViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var eventHandler: SuperHeroesListPresenterInterface!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        eventHandler.viewLoaded()
    }
}

extension SuperHeroesListViewController: SuperHeroesView
{
    func set(dataSource: UITableViewDataSource & UITableViewDelegate)
    {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    func reloadData()
    {
        tableView.reloadData()
    }
    
    func registerNib(nib: UINib, reuseIdentifier: String)
    {
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func set(title: String)
    {
        self.title = title
    }
}
