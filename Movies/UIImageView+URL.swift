//
//  UIImageView+URL.swift
//  Movies
//
//  Created by Christian Lobach on 22/06/15.
//  Copyright © 2015 B264 GmbH. All rights reserved.
//

import UIKit

extension UIImageView {

    func setImageWithURL(url: NSURL) {


        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { data, response, error in

            if let data = data {

                dispatch_async(dispatch_get_main_queue()) { [weak self] in
                    let image = UIImage(data: data)
                    self?.image = image
                }
            }

        }

        task?.resume()

    }

}