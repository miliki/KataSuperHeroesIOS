import UIKit
import SDWebImage

class SuperHeroesListCell: UITableViewCell
{
    
    @IBOutlet weak var superHeroImage: UIImageView!
    @IBOutlet weak var avengersIcon: UIImageView! {
        didSet {
            avengersIcon.image = #imageLiteral(resourceName: "ic_avengers")
        }
    }
    @IBOutlet weak var name: UILabel!
    
    var superHero: SuperHero? {
        didSet {
            guard let superHero = superHero else { return }
            
            updateView(forSuperHero: superHero)
        }
    }
    
    private func updateView(forSuperHero superHero: SuperHero)
    {
        name.text = superHero.name
        avengersIcon.isHidden = superHero.isAvenger
        superHeroImage.sd_setImage(with: superHero.imageURL)
    }
}
