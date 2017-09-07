struct SuperHeroes
{
    let superHeroes: [SuperHero]
    
    var count: Int { return superHeroes.count }
    
    subscript(_ index: Int) -> SuperHero
    {
        return superHeroes[index]
    }
}
