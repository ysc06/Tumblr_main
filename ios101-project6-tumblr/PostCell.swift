//
//  PostCell.swift
//  ios101-project6-tumblr
//

import UIKit
import NukeExtensions

class PostCell: UITableViewCell {
    @IBOutlet weak var summaryLabel: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    var posts = [Post]()

   

  

    func configure(with post: Post) {
        summaryLabel.text = post.summary

        if let photo = post.photos.first {
            let url = photo.originalSize.url
            NukeExtensions.loadImage(with: url, into: postImageView)
        }
    }
}

