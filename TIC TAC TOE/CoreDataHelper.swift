//
//  CoreDataHelper.swift
//  TIC TAC TOE
//
//  Created by Manar Mahmalji on 8/24/17.
//  Copyright © 2017 Manar Mahmalji. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
   
    
    
    static func saveGame() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func retrieveSavedGame() -> TicTaToeRsumedGame? {
        let fetchRequest = NSFetchRequest<TicTaToeRsumedGame>(entityName: "TicTacToeResumedGame")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results[0]
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return nil
    }
    
    
    
  
    
    
    
}

