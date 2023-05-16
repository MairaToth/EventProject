import Foundation

struct EventListViewModel {
    let eventLists: [EventModel]
}

extension EventListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        return self.eventLists.count
    }
    
    func eventAtIndex(_ index: Int) -> EventViewModel {
        let eventList = self.eventLists[index]
        return EventViewModel(eventList)
    }
}

struct EventViewModel {
    private let eventList: EventModel
}

extension EventViewModel {
    init(_ eventList: EventModel) {
        self.eventList = eventList
    }
}

extension EventViewModel {
    
    var date: String {
        let timeStamp = eventList.date
        let timeInterval = TimeInterval(timeStamp ?? 0)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
  
    var description: String {
        return self.eventList.description ?? ""
    }
    
    var image: String {
        return self.eventList.image ?? ""
    }
  
    var longitud: Double {
        return self.eventList.longitud ?? 0.0
    }
    
    var latitude: Double {
        return self.eventList.latitude ?? 0.0
    }
  
    var price: Double {
        return self.eventList.price ?? 0.0
    }
    
    var title: String {
        return self.eventList.title ?? ""
    }
    
    var id: String {
        return self.eventList.id ?? ""
    }
}
