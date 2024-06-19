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

//===============================Error Handeling in Combine==============================

/*enum NumberError: Error {
    case operationFailed
}

let numberPublisher = [1,2,3,4,5,6].publisher

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
}


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
}*/

//=============================================Combine Framework - Operators=====================

// Transformation Operators (map, flatMap, merge etc).

/*let numberPublisher1 = (1...5).publisher
let squaredNumber = numberPublisher1.map { $0 * $0 }

// Now Subscribe the Publisher
squaredNumber.sink { value in
    print(value)
}
 
// flatMap

let namePublisher = ["John", "Mary", "Steven"].publisher
let flattedName = namePublisher.flatMap { name in
    name.publisher
}

// Now Subscribe the Publisher
flattedName.sink { char in
    print(char)
}

// Merge
let publisher1 = [1,2,3].publisher
let publisher2 = [4,5,6].publisher
let publisher3 = ["A", "B"].publisher

let mergedPublisher = Publishers.Merge(publisher1, publisher2)
mergedPublisher.sink { value in
    print(value)
}

//===============================Filtering Operators(filter, compactMap, debounce etc)====================

// filter
let numberPublisher = (1...10).publisher
let evenNumPublisher = numberPublisher.filter { $0 % 2 == 0}

// Now Subscribe the Publisher
let cancellable = evenNumPublisher.sink { value in
    print(value)
}

// compactMap -> It will ignore the nil value and handle optionals
let stringPublisher = ["1","2","3","4","5","A","B"].publisher
let numPublisher = stringPublisher.compactMap { Int($0) }

// Now Subscribe the Publisher
let cancellables = numPublisher.sink { value in
    print(value)
}

// debounce
let textPublisher = PassthroughSubject<String, Never>() // Never means it will never fail or throw error
let debouncePublisher = textPublisher.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)

let cancellable1 = debouncePublisher.sink { value in
    print(value)
}

textPublisher.send("A")
textPublisher.send("B")
textPublisher.send("C")
textPublisher.send("D")
textPublisher.send("E")
textPublisher.send("F")
textPublisher.send("G")*/


//=======================Combining Operators(combineLatest, zip, switchToLatest)=========================================

//combineLatest
/*let publisher11 = CurrentValueSubject<Int, Never>(1)
let publisher22 = CurrentValueSubject<Int, Never>(2)

let combinePublisher = publisher11.combineLatest(publisher22)

combinePublisher.sink { value1, value2 in
    print("Value 1 is: \(value1) and Value 2 is: \(value2)")
}

publisher11.send(3)
publisher22.send(4)

let intPublishers = CurrentValueSubject<Int, Never>(1)
let stringPublisher = CurrentValueSubject<String, Never>("Hello")

let combinedPublisher = intPublishers.combineLatest(stringPublisher)

let cancellable = combinedPublisher.sink { value1, value2 in
    print("Value 1 is: \(value1) and Value 2 is: \(value2)")
}

intPublishers.send(3)
stringPublisher.send("World")

// zip
let zipPublisher1 = [1,2,3].publisher
let zipPublisher2 = ["A", "B", "C"].publisher

let zippedPublisher = zipPublisher1.zip(zipPublisher2)

let cancellable = zippedPublisher.sink { value1, value2 in
    print("Value1: \(value1) and Value2: \(value2)")
}

// If combining more than 2 publisher.
let zipPublisher11 = [1,2,3].publisher
let zipPublisher22 = ["A", "B", "C"].publisher
let zipPublisher33 = ["John", "Marry", "Steve"].publisher

let zippedPub = Publishers.Zip3(zipPublisher11, zipPublisher22, zipPublisher33)

let cancellable = zippedPub.sink { values in
    print("\(values.0) \(values.1) \(values.2)")
}


// switchToLatest
let outerPublisher = PassthroughSubject<AnyPublisher<Int, Never>, Never>()
let innerPublisher1 = CurrentValueSubject<Int, Never>(1)
let innerPublisher2 = CurrentValueSubject<Int, Never>(2)

let cancellable = outerPublisher
    .switchToLatest()
    .sink { value in
        print(value)
    }

outerPublisher.send(AnyPublisher(innerPublisher1))
innerPublisher1.send(10)

outerPublisher.send(AnyPublisher(innerPublisher2))
innerPublisher2.send(20)

innerPublisher2.send(100)*/


//============================Error handling operators (catch, replaceError, retry etc.)=========================
enum SampleError: Error {
    case operationFailed
}

/*let numbersPublishers = [1,2,3,4,5,6,7,8].publisher

let transformPublisher = numbersPublishers.tryMap { value in
    if value == 3 {
        throw SampleError.operationFailed
    }
    
    return value
}.catch { error in
    print(error)
    return Just(0)
}

transformPublisher.sink { value in
    print(value)
}*/


// replaceError with single value
/*let numberPublisher = [1,2,3,4,5,6,7,8].publisher

let transformedPublisher = numberPublisher.tryMap { value in
    if value == 3 {
        throw SampleError.operationFailed
    }
    
    return value
}.replaceError(with: -1)

// subscribe the publisher
let cancellable = transformedPublisher.sink { value in
    print(value)
}

// replaceError with another publisher
let numberPublisher111 = [1,2,3,4,5,6,7,8].publisher
let fallbackPublisher = Just(-1)

let transformedPub = numberPublisher111.tryMap { value in
    if value == 3 {
        throw SampleError.operationFailed
    }
    
    return Just(value)
}.replaceError(with: fallbackPublisher)

let cancellables = transformedPub.sink { publisher in
    let _ = publisher.sink { value in
        print(value)
    }
}

// retry publisher
let publisher = PassthroughSubject<Int, Error>()

let retriedPublisher = publisher.tryMap { value in
    if value == 3 || value == 6 || value == 9 {
        throw SampleError.operationFailed
    }
    
    return value
}.retry(2) // 2 means we want to retry 2 times to attach to the Publisher.

let cancellable = retriedPublisher.sink { completion in
    switch completion {
    case .finished:
        print("Publisher has completed.")
    case .failure(let error):
        print("Publisher has failed with: \(error)")
    }
} receiveValue: { value in
    print(value)
}

publisher.send(1)
publisher.send(2)
publisher.send(3)  // failed
publisher.send(4)
publisher.send(5)
publisher.send(6)  // failed
publisher.send(7)
publisher.send(8)
publisher.send(9)  // failed
publisher.send(10)
publisher.send(11)*/


//===================Understanding Subjects in Combine (PassthroughSubject and CurrentValueSubject)=======

// Subjects - publish and they can also subsribe.

// PassthroughSubject

/*let subject = PassthroughSubject<Int, Never>()

// Subscribe the subject
let cancellable = subject.sink { value in
    print(value)
}

// Publish the subject
subject.send(1)
subject.send(2)


// CurrentValueSubject
let currentValueSubject = CurrentValueSubject<String, Never>("John")

let cancellable = currentValueSubject.sink { value in
    print(value)
}

currentValueSubject.send("Hello")

/* currentValueSubject holds the last value but PassthroughSubject not*/
print(currentValueSubject.value)*/


//======================Creating custom subjects that takes only Even value ===================================
/*class EvenSubject<Failure: Error>: Subject {
    
    typealias Output = Int
    
    private let wrapped: PassthroughSubject<Int, Failure>
    
    init(initialValue: Int) {
        self.wrapped = PassthroughSubject()
        let evenInitialValue = initialValue % 2 == 0 ? initialValue : 0
        wrapped.send(evenInitialValue)
    }
    
    func send(subscription: Subscription) {
        wrapped.send(subscription: subscription)
    }
    
    func send(_ value: Int) {
        if value % 2 == 0 {
            wrapped.send(value)
        }
    }
    
    func send(completion: Subscribers.Completion<Failure>) {
        wrapped.send(completion: completion)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        wrapped.receive(subscriber: subscriber)
    }
    
}

let subject = EvenSubject<Never>(initialValue: 2)

let cancellable = subject.sink { value in
    print(value)
}

subject.send(4)
subject.send(8)
subject.send(13)*/


// # Weather client using subjects :-
/*Here we see how PassthroughSubject works in the real world.*/

class WeatherClient {
    
    let updates = PassthroughSubject<Int, Never>()
    
    func fetchWeatehr() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            // Publish the subject
            self?.updates.send(Int.random(in: (32...100))) // Here we can also call the api
        }
    }
}

let client = WeatherClient()

// Subscribe the subject
let cancellable = client.updates.sink { value in
    print(value)
}

client.fetchWeatehr()
