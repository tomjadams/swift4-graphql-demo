import UIKit

class ViewController: UIViewController {
    @IBOutlet private var textView: UITextView!
    @IBOutlet private var goButton: UIButton!
    
    let url = "http://localhost:8080/v1/graphql?query=%7B+categories+%7B+name+%7D+%7D"

    // http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4/
    
    @IBAction func tappedGo(button: UIButton) {
        
        // get the response content
        let c = try! String(contentsOf: URL(string: url)!)
        print(c)
        
        // render the response
        DispatchQueue.main.async {
            self.textView.text = c
        }

    }
}

