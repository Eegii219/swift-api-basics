//: [Previous](@previous)

import Foundation

var greeting = "Hello, Async Await!"



// Simulate some time-consuming task
func doTask(number: Int) async -> String {
    // Simulate a 1-second delay asynchronously
    await Task.sleep(1 * 1_000_000_000) // 1 second delay
    return "Task \(number) completed"
}

// Using Task Group to run multiple tasks concurrently
func runConcurrentTasks() async {
    // Create a dispatch group to track task completion
    let dispatchGroup = DispatchGroup()
    
    // Creating multiple tasks concurrently
    for i in 1...3 {
        dispatchGroup.enter()  // Enter the dispatch group
        
        // Run the task
        Task {
            let result = await doTask(number: i)
            print(result)  // Prints task results like "Task 1 completed"
            dispatchGroup.leave()  // Leave the dispatch group once task is completed
        }
    }
    
    // Wait for all tasks in the dispatch group to finish
    dispatchGroup.notify(queue: .main) {
        print("All tasks are done!")
    }
}

// Usage
Task {
    await runConcurrentTasks()
}

