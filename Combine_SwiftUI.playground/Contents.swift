import UIKit
import Combine

/*// Creating and working with Publisher:-
let publisher = Just("Hello World")

let cancellable = publisher.sink { value in
    print(value)
}

// cancel is not required it will cancel automatically once it goes out of the scope.
cancellable.cancel()


// Sequence Publisher

let numberPublisher = [1,2,3,4,5,6].publisher
let doublePublisher = numberPublisher.map { $0 * 2 }

doublePublisher.sink { value in
    print(value)
}


// Subscribing to Publishers
// Timer Publisher

let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
let cancelable = timerPublisher.autoconnect().sink { timestamp in
    print("Timestamp:- \(timestamp)")
}


// Number Publisher.
let numberPublishers = (1...10).publisher
let cancellables = numberPublishers.sink { value in
    print(value)
}

// Manually cancel the subscription
DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    cancellables.cancel()
    print("Subscription Cancelled")
}*/


// Error Handeling in Combine

enum NumberError: Error {
    case operationFailed
}

/*let numberPublisher = [1,2,3,4,5,6].publisher

let doublePublisher = numberPublisher.tryMap { number in
    if number == 4 {
        throw NumberError.operationFailed
    }
    
    return number * 2
}
    .catch { error in
        if let numberError = error as? NumberError {
            print("Error occurred: \(numberError)")
        }
        
        return Just(0) // Return is mendatory in catch, that's why returned Just(0)
    }

// Now Subscribe the Publisher
let cancellable = doublePublisher.sink { completion in
    switch completion {
    case .finished:
        print("finished")
    case .failure(let error):
        print(error)
    }
} receiveValue: { value in
    print(value)
}*/


// Handle same error by using mapError
let numberPublisher = [1,2,3,4,5,6].publisher

let doublePublisher = numberPublisher.tryMap { number in
    if number == 4 {
        throw NumberError.operationFailed
    }
    
    return number * 2
}
    .mapError { error in
        return NumberError.operationFailed
    }


let cancellable = doublePublisher.sink { completion in
    switch completion {
    case .finished:
        print("Finished")
    case .failure(let error):
        print(error)
    }
} receiveValue: { value in
    print(value)
}

