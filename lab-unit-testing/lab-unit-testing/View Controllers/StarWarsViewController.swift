//
//  StarWarsViewController.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    var starWars = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()

        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "starwars", ofType: "json") else {fatalError("Could not find path")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let moviesFromJSON = StarWars.getMovies(from: data)
            starWars = moviesFromJSON
        } catch let loadDataError {
            fatalError("Error: \(loadDataError)")
        }
    }

}

extension StarWarsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        let oneStarWar = starWars[indexPath.row]
        cell.textLabel?.text = oneStarWar.title
        cell.detailTextLabel?.text = oneStarWar.release_date
        return cell
    }
    
    
}
