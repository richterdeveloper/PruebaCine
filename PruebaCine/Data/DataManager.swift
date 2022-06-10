//
//  DataManager.swift
//  PruebaCine
//
//  Created by mespinal on 9/06/22.
//

import Foundation
import CoreData

class DataManager  {
    
    static let shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "PruebaCine")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func movie(id: Int64, title: String, original_title: String, overview: String, release_date: String, poster_path: String, vote_average: Double) -> MovieEntity {
        
        let movie = MovieEntity(context: persistentContainer.viewContext)
        movie.id = id
        movie.title = title
        movie.original_title = original_title
        movie.overview = overview
        movie.release_date = release_date
        movie.poster_path = poster_path
        movie.vote_average = vote_average
        
        return movie
    }
    
    func movies() -> [MovieEntity] {
        
        let request: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        
        var fetchedMovies: [MovieEntity] = []
        
        do {
            fetchedMovies = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching movies")
        }
        
        return fetchedMovies
    }
    
    // MARK: - Core Data Saving support
    func save() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
