//
//  TableViewController.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let viewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()


        title = "Movies"

        viewModel.loadMovies({ [weak self] in

            dispatch_async(dispatch_get_main_queue()) {
                self?.tableView.reloadData()
            }

            },
            failure: { error in
                print(error)
        })
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieViewModels?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)

        let movieViewModel = viewModel.movieViewModels?[indexPath.row]

        cell.textLabel?.text = movieViewModel?.title

        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailsViewController = segue.destinationViewController as? DetailsViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPathForCell(cell),
            let movieViewModel = viewModel.movieViewModels?[indexPath.row] {
                detailsViewController.viewModel = movieViewModel
        }
    }
}
