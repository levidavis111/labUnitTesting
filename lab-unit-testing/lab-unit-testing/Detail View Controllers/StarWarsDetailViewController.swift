//
//  StarWarsDetailViewController.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class StarWarsDetailViewController: UIViewController {
    
    var starWar: Movie!

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        // Do any additional setup after loading the view.
    }
    

    func setupView() {
        textView.text = starWar.opening_crawl
        textView.textColor = .yellow
        textView.backgroundColor = .black
    }

}
