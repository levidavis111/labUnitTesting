//
//  RandomFactViewController.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class RandomFactViewController: UIViewController {
    
    var randomFacts = [Fact]() {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RandomFactDetailViewController {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let factVC = segue.destination as? RandomFactDetailViewController else {return}
            let oneFact = randomFacts[indexPath.row]
            factVC.fact = oneFact
            factVC.answerArray = oneFact.allAnswerArray()
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
        guard let pathToJSONFile = Bundle.main.path(forResource: "randomfacts", ofType: "json") else {fatalError("Could not find path")}
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let factsFromJSON = ArrayOfFacts.getFacts(from: data)
            randomFacts = factsFromJSON
        } catch let loadDataError {
            fatalError("Error: \(loadDataError)")
        }
    }

}

extension RandomFactViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomFactCell", for: indexPath)
        let oneFact = randomFacts[indexPath.row]
        cell.textLabel?.text = oneFact.question.removingPercentEncoding
        return cell
        
    }
    
    
}
