//
//  RandomJokeViewController.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class RandomJokeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var joke = [Joke]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "joke", ofType: "json") else {fatalError("Could not find path")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let jokeFromJSON = Joke.getJokes(from: data)
            joke = jokeFromJSON
        } catch let loadDataError {
            fatalError("Error: \(loadDataError)")
        }
    }

}

extension RandomJokeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return joke.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let oneJoke = joke[indexPath.row]
        cell.textLabel?.text = oneJoke.setup
        
        return cell
    }
}
