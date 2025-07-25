import UIKit
import NukeExtensions

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var post: Post?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isScrollEnabled = true      // Allows scrolling
        textView.isEditable = false          // Prevents keyboard popping up
        textView.isSelectable = true         // Allows selection
        textView.textContainerInset = .zero  // Removes extra padding
        textView.textContainer.lineFragmentPadding = 0
        let alert = UIAlertController(title: "Welcome!", message: "Enjoy Humans of New York posts ✨", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Let's Go", style: .default))
        present(alert, animated: true)

        // Safely unwrap the post before accessing its properties
        if let post = post {
            textView.text = "SUMMARY: \(post.summary)"


            if let photo = post.photos.first {
                let url = photo.originalSize.url
                NukeExtensions.loadImage(with: url, into: imageView)
            }
        } else {
            print("❌ post was nil — check segue logic!")
        }
    }


}
