import UIKit


//Task1


enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func printDayOfWeek(day: DayOfWeek) {
    switch day {
    case .monday:
        print("ორშაბათი")
    case .tuesday:
        print("სამშაბათი")
    case .wednesday:
        print("ოთხშაბათი")
    case .thursday:
        print("ხუთშაბათი")
    case .friday:
        print("პარასკევი")
    case .saturday:
        print("შაბათი")
    case .sunday:
        print("კვირა")
    }
}


printDayOfWeek(day: .sunday)

print("----------------------------------------------------------------------")


//Task2

enum Weather {
    case sunny(Celsius: Double)
    case cloudy(Celsius: Double)
    case rainy(Celsius: Double)
    case snowy(Celsius: Double)
}

func dressAppropriately(for weather: Weather) -> String {
    switch weather {
    case .sunny(let temperature):
        if temperature > 25 {
            return "მზიანი და ცხელი ამინდია, ჩაიცვით გრილად და წაისვით მზისგან დამცავი კრემი."
        } else {
            return "მზიანი ამინდია, თუმცა არც ისე ცხელი, ჩაიცვით ნორმალურად."
        }
    case .cloudy(let temperature):
        if temperature > 20 {
            return "ღრუბლიანი, თუმცა თბილი ამინდია. ჩაიცვით ჩვეულებრივ."
        } else {
            return "ღრუბლიანი და გრილი ამინდია, მოიცვით მოსაცმელი."
        }
    case .rainy(let temperature):
        if temperature > 15 {
            return "წვიმიანი, თუმცა შედარებით თბილი ამინდია, წაიღეთ ქოლგა."
        } else {
            return "გრილი და წვიმიანი ამინდია, ჩაიცვით საწვიმარი."
        }
    case .snowy(let temperature):
        if temperature > 0 {
            return "თოვლი მოდის. ჩაიცვით თბილი ქურთუკი და დაიხურეთ ქუდი."
        } else {
            return "ყინავს, ყველაფერი ჩაიცვით რაც გაგაჩნიათ"
        }
    }
}


let sunnyWeather = Weather.sunny(Celsius: 30)
let recommendation = dressAppropriately(for: sunnyWeather)
print(recommendation)

print("----------------------------------------------------------------------")

//Task3


struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}


var books: [Book] = []



let book1 = Book(title: "თოფურია გაძლიერებული მათემატიკა", author: "თოფურია", publicationYear: 2020)
let book2 = Book(title: "ღვაბერიძე გეომეტრია", author: "ღვაბერიძე", publicationYear: 2021)
let book3 = Book(title: "აბსტრაქტული ალგებრა", author: "პროფესორი ბატონი ვოლფგანგი", publicationYear: 2022)
let book4 = Book(title: "დისკრეტული სტრუქტურები", author: "ასევე პროფესორი ვოლფგანგი", publicationYear: 2022)

books.append(book1)
books.append(book2)
books.append(book3)
books.append(book4)


func getBooksPublishedAfterYear(_ year: Int) -> [Book] {
    var filteredBooks: [Book] = []
    for book in books {
        if book.publicationYear > year {
            filteredBooks.append(book)
        }
    }
    return filteredBooks
}


let booksPublishedAfter2022 = getBooksPublishedAfterYear(2020)


for book in booksPublishedAfter2022 {
    print("სათაური: \(book.title), ავტორი: \(book.author), გამოშვების თარიღი: \(book.publicationYear)")
}
print("----------------------------------------------------------------------")


//Task4


struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double
    
   
    mutating func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("\(holderName) შეავსეთ \(amount) ლარი")
        } else {
            print("შეცდომა: გაიმეორეთ დადეპოზიტებული თანხა")
        }
    }
    
   
    mutating func withdraw(amount: Double) {
        if amount > 0 {
            if balance >= amount {
                balance -= amount
                print("\(holderName)-მა ბანკომატიდან გამოიტანა\(amount) ლარი")
            } else {
                print("შეცდომა: თქვენ არ გაქვთ საკმარისი თანხა")
            }
        } else {
            print("შეცდომა: გაიმეორეთ თანხა")
        }
    }
}


var account1 = BankAccount(holderName: "დავით, ", accountNumber: "123456", balance: 1000.0)


account1.deposit(amount: 500.0)


account1.deposit(amount: -200.0)


account1.withdraw(amount: 700.0)


account1.withdraw(amount: 2000.0)
print("----------------------------------------------------------------------")

//Task5

enum Genre {
    case rock
    case pop
    case hipHop
    case jazz
    case classical
}

// Song struct-ის შექმნა
struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        return "\(title) by \(artist) (\(genre))"
    }
    
    lazy var publisher: String = {
        return "\(artist) Music"
    }()
}

var playlist: [Song] = []

let song1 = Song(title: "Better", artist: "Guns n' Roses", duration: 3.5, genre: .rock)
let song2 = Song(title: "Yoga Pilates", artist: "Zazuna", duration: 4.2, genre: .pop)
let song3 = Song(title: "19-2000", artist: "Gorillaz", duration: 2.8, genre: .hipHop)
let song4 = Song(title: "Kius bendi", artist: "rezom mokla omari", duration: 5.1, genre: .jazz)
let song5 = Song(title: "Mozzart", artist: "Symphony N. 40", duration: 3.9, genre: .classical)
let song6 = Song(title: "Tell Me baby", artist: "Red Hot Chilli Peppers", duration: 3.5, genre: .rock)


playlist.append(song1)
playlist.append(song2)
playlist.append(song3)
playlist.append(song4)
playlist.append(song5)
playlist.append(song6)


func songsInGenre(_ genre: Genre) -> [Song] {
    let filteredSongs = playlist.filter { $0.genre == genre }
    return filteredSongs
}

let rockSongs = songsInGenre(.rock)
for song in rockSongs {
    print(song.description)
}

