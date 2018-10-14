import UIKit

class ViewController: UIViewController, LogoDownloaderDelegate {
    
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var logoDownloader:LogoDownloader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0.0
        loginView.alpha = 0.0
        
        // NASA images used pursuant to https://www.nasa.gov/multimedia/guidelines/index.html
        let imageURL: String = "https://cdn.spacetelescope.org/archives/images/publicationjpg/heic1509a.jpg"
        
        logoDownloader = LogoDownloader(logoURL: imageURL)
        logoDownloader?.delegate = self // try nil here
        logoDownloader?.downloadLogo()
        
        if logoDownloader?.delegate == nil {
            loginView.alpha = 1.0
        }
    } // end func viewDidLoad()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Implement LogoDownloaderDelegate
    func didFinishDownloading(_ sender: LogoDownloader) {
        imageView.image = logoDownloader?.image
        
        UIView.animate(withDuration: 2.0, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations:  {
            self.loadingLabel.alpha = 0.0
            self.imageView.alpha = 1.0
        }) { (completed:Bool) in
            if (completed) {
                UIView.animate(withDuration: 2.0) {
                    self.loginView.alpha = 1.0
                }
            }
        }
    }
    
}
