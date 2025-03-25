import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        print(urlString)
        self.kf.setImage(with: url, placeholder: UIImage(named: "logo"))
    }
}
