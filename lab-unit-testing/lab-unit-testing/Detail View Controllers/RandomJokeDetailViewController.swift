//
//  RandomJokeDetailViewController.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class RandomJokeDetailViewController: UIViewController {
    
    var joke: Joke!

    @IBOutlet weak var punchlineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    

    private func setupView() {
    punchlineLabel.text = joke.punchline
    }

}
