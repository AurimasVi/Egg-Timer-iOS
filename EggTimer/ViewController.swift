import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var doneLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneLabel.alpha = 0
        progressBar.progress = 0
        
        if let progressBar = progressBar {
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                progressBar.heightAnchor.constraint(equalToConstant: 20)
            ])
        }
        var supportedInterfaceOrientations: UIInterfaceOrientationMask {
               return .all
           }

        var shouldAutorotate: Bool {
               return true
           }
    }
    
    let eggTimes = ["Soft": 8, "Medium": 10, "Hard": 12]
    var secondsRemaining: Int = 0
    var totalTime: Int = 0
    var timer: Timer?

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        // Invalidate the previous timer if it exists
        timer?.invalidate()
        
        // Retrieve the cooking time for the selected hardness
        if let time = eggTimes[hardness] {
            totalTime = time
            startTimer(seconds: time)
        }
    }

    func startTimer(seconds: Int) {
        secondsRemaining = seconds
        
        // Schedule a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            if self.secondsRemaining > 0 {
                self.progressBar.progress = Float(self.totalTime - self.secondsRemaining) / Float(self.totalTime)
                self.doneLabel.text = "\(self.secondsRemaining) seconds"
                self.doneLabel.alpha = 1
                self.secondsRemaining -= 1
            } else {
                self.progressBar.progress = 1.0 // Ensure the progress bar is fully filled
                self.doneLabel.text = "DONE!"
                self.doneLabel.alpha = 1
                timer.invalidate()
            }
        }
    }
}
