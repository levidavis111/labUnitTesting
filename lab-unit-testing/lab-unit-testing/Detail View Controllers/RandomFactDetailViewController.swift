//
//  RandomFactDetailViewController.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class RandomFactDetailViewController: UIViewController {
    
    var fact: Fact!
    var answerArray: [String]!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
   

}

extension RandomFactDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
        let oneAnswer = answerArray[indexPath.row]
        cell.textLabel?.text = oneAnswer.removingPercentEncoding
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if answerArray[indexPath.row] == fact.correct_answer {
            self.view.backgroundColor = .green
        } else {
            self.view.backgroundColor = .red
        }
    }
    
    
}
