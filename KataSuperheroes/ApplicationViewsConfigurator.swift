import UIKit

struct ApplicationViewsConfigurator
{
    func setupViewStyle()
    {
        UINavigationBar.appearance().barTintColor = UIColor(red: 66.0/255.0, green: 75.0/255.0, blue: 87.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    }
}
