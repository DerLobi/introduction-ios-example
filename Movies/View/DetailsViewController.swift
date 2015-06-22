//
//  DetailsViewController.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var viewModel: MovieViewModel?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        title = viewModel?.title
        textView.text = viewModel?.overview
        imageView.setImageWithURL(viewModel!.imageURL)
    }
}
