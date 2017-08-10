import UIKit

// Details: http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4/
class ViewController: UIViewController {
    @IBOutlet private var jsonView: UITextView!
    @IBOutlet private var categoriesView: UITextView!
    @IBOutlet private var goButton: UIButton!
    
    let url = "http://localhost:8080/v1/graphql?query=%7B+categories+%7B+name+%7D+%7D"

    @IBAction func tappedGo(button: UIButton) {

        // get the response content
        let jsonString = try! String(contentsOf: URL(string: url)!)

        // let's parse the response
        let decoder = JSONDecoder()
        let jsonData = jsonString.data(using: .utf8)!
        let decodedGraphQlResponse = try! decoder.decode(GraphQlResponse.self, from: jsonData)

        // render the decoded response
        DispatchQueue.main.async { self.categoriesView.text = decodedGraphQlResponse }

        // pretty print the JSON
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(decodedGraphQlResponse)
        let prettyJson = String(data: data, encoding: .utf8)!
        
        // render the JSON
        DispatchQueue.main.async { self.jsonView.text = prettyJson }
    }
}

