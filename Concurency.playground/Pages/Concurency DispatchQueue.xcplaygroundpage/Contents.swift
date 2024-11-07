//: [Previous](@previous)

import Foundation

var greeting = "Hello, Concurency!"

/*
 Concurency Multy Threading!
 */


func getData() {
    let urls = [
        "http://api.google.com/1",
        "http://api.google.com/2",
        "http://api.google.com/3"
    ]
    
    let group = DispatchGroup()
    
    for url in urls {
        group.enter()  // Enter the group to track the task
        
        DispatchQueue.global().async {
            print("Fetching \(url)")
            
            // Simulate a network request with Task.sleep (or replace with actual network request)
            // Assuming each fetch takes 2 seconds to simulate a network request
            sleep(2)
            
            print("Finished fetching \(url)")
            group.leave()  // Leave the group after the task is done
        }
    }
    
    // Wait for all tasks to finish
    group.notify(queue: .main) {
        print("All data fetching tasks are complete!")
    }
}

// Call the function
getData()

// Run the run loop to allow async tasks to complete (important if you're running in a script or playground)
RunLoop.main.run()
