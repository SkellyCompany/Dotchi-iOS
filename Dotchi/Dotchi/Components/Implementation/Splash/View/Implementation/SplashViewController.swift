//
//  SplashViewController.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.Colors.pastelBackground.color
        let splashImage = UIImage(systemName: "pawprint.fill")?.withRenderingMode(.alwaysTemplate)
        let splashImageView = UIImageView(image: splashImage)
        splashImageView.setImageColor(to: Asset.Colors.accent.color)
        splashImageView.contentMode = .scaleAspectFit
        view.addSubview(splashImageView)
        splashImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            splashImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }, completion: nil)
    }
}
