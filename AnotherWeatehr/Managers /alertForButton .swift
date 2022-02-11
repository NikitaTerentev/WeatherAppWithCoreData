//
//  alertForButton .swift
//  AnotherWeatehr
//
//  Created by Nikita on 17.12.2021.
//

import UIKit


extension TableVC {
    
    func alert(onSelect: @escaping (String) -> Void) {
        let name = "Add city"
        let placeholder = "Write some city..."
        
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let okayAlert = UIAlertAction(title: "OK", style: .default) { (action) in
            let textTF = alertController.textFields?.first
            guard let text = textTF?.text else  { return }
            onSelect(text)
                
                }
        alertController.addTextField { (tf) in
            tf.placeholder = placeholder
        
            }
        
        let cancelAlert = UIAlertAction(title: "Cancel", style: .default) { [weak alertController] _ in
            alertController?.dismiss(animated: true, completion: nil)

        }
        alertController.addAction(okayAlert)
        alertController.addAction(cancelAlert)
        
        present(alertController, animated: true, completion: nil)
    }

}
