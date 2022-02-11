//
//  ViewController.swift
//  buggsyK
//
//  Created by Felipe Montoya on 2/10/22.
//

import UIKit

//TODO: Layout 2 - No nav bar title...
class ViewController: UIViewController {

    @IBAction func didPressedChallangeAcceptedButton(_ sender: Any) {
        //TODO: Runtime 1 - No IBAction
        present(TableViewController(), animated: true, completion: nil)
    }
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    private func addiOSDevSignatureLabel() {
        let label = UILabel()
        label.text = "Solved by [INSERT YOUR NAME HERE]"
        //TODO: Layout 1 - Incorrect label positioning
        //self.view.addSubview(label)
    }
   
    func showActivityIndicator() {
         let child = ActivityIndicatorViewController()
         self.addChild(child)
         child.view.frame = self.view.frame
         self.view.addSubview(child.view)
         child.didMove(toParent: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addiOSDevSignatureLabel()
        //TODO: Runtime 2 - Update UI outside main thread while loading image.
        //TODO: Memory Leak - Activity indicator viewcontroller, points to self and self.
        showActivityIndicator()
        ImageService.downloadImage { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let data):
                    self?.logoImageView.image = UIImage(data: data)
                    self?.children.first?.willMove(toParent: nil)
                    self?.children.first?.view.removeFromSuperview()
                    self?.children.first?.removeFromParent()
                case .failure(_ ):
                    //TODO: Handle Failure
                    break
                }
            }
            
        }
    }


}

