import UIKit

// Details: http://benscheirman.com/2017/06/ultimate-guide-to-json-parsing-with-swift-4/
class ViewController: UIViewController {
    @IBOutlet private var jsonView: UITextView!
    @IBOutlet private var productsView: UITextView!
    @IBOutlet private var goButton: UIButton!
    
    let url = "http://localhost:8080/v1/graphql?query=%7B+categories+%7B+name+products+%7B+displayName+%7D+%7D+%7D"

    @IBAction func tappedGo(button: UIButton) {

        // get the response content
        let jsonString = try! String(contentsOf: URL(string: url)!)

        // let's parse the response
        let decoder = JSONDecoder()
        let jsonData = jsonString.data(using: .utf8)!
        let decodedGraphQlResponse = try! decoder.decode(GraphQlResponse.self, from: jsonData) // this is typesafe!

        // render the decoded response
        DispatchQueue.main.async {
            let names = decodedGraphQlResponse.data.categories.flatMap { $0.products.map { $0.name } }
            let ps = Set(names).sorted().joined(separator: ", ")
            self.productsView.text = ps
        }

        // pretty print the JSON
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(decodedGraphQlResponse)
        let prettyJson = String(data: data, encoding: .utf8)!

        // render the JSON
        DispatchQueue.main.async { self.jsonView.text = prettyJson }
    }
}

