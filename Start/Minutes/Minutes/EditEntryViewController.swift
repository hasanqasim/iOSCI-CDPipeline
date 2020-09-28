import Foundation
import UIKit
import AppCenterAnalytics
//import AppCenterCrashes


class EditEntryViewController: UIViewController
{
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var entry: Entry? = nil
    
    override func viewDidLoad() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(EditEntryViewController.onSave))

        navigationItem.rightBarButtonItem = saveButton

        if entry == nil {
            entry = Entry()
            self.title = "Add New Entry"
        } else {
            let date = entry!.createdDate.timeIntervalSinceNow * -1
            let interval = String(format: "%.0f", date)
            let property = ["id":entry!.id, "time elapsed": interval]
            MSAnalytics.trackEvent("EditEntry", withProperties: property)
        }
        
        titleTextField.text = entry?.title
        contentTextView.text = entry?.content
    }

    @objc func onSave(_ sender: UIBarButtonItem)
    {
        //MSCrashes.generateTestCrash()
        entry?.title = titleTextField.text!
        entry?.content = contentTextView.text!
        
        AppDelegate.entries.write(entry!)
        navigationController?.popViewController(animated: true)
    }
}
