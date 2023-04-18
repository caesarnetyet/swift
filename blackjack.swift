// A class to represent a card
class Card {
    var suit: String // The suit of the card (clubs, diamonds, hearts, or spades)
    var rank: String // The rank of the card (ace, 2, 3, ..., 10, jack, queen, or king)
    var value: Int // The value of the card (1 for ace, 2 for 2, ..., 10 for 10 and face cards)

    // A constructor to initialize a card with a suit and a rank
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        // Assign the value based on the rank
        switch rank {
        case "ace":
            self.value = 1
        case "jack", "queen", "king":
            self.value = 10
        default:
            self.value = Int(rank) ?? 0 // Convert the rank to an integer or 0 if not possible
        }
    }

    // A method to return a string representation of a card
    func toString() -> String {
        return "\(rank) of \(suit)"
    }
}

// A class to represent a deck of cards
class Deck {
    var cards: [Card] // An array of cards in the deck

    // A constructor to initialize a deck with 52 cards
    init() {
        self.cards = []
        // Create an array of suits and an array of ranks
        let suits = ["clubs", "diamonds", "hearts", "spades"]
        let ranks = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]
        // Loop through each suit and each rank and create a card
        for suit in suits {
            for rank in ranks {
                let card = Card(suit: suit, rank: rank)
                self.cards.append(card) // Add the card to the deck
            }
        }
    }

    // A method to shuffle the deck
    func shuffle() {
        // Loop through each index in the deck
        for i in 0..<self.cards.count {
            // Generate a random index between i and the end of the deck
            let j = Int.random(in: i..<self.cards.count)
            // Swap the cards at i and j
            let temp = self.cards[i]
            self.cards[i] = self.cards[j]
            self.cards[j] = temp
        }
    }

    // A method to deal a card from the top of the deck
    func deal() -> Card? {
        // Check if the deck is empty
        if self.cards.isEmpty {
            return nil // Return nil if no cards left
        } else {
            return self.cards.removeFirst() // Remove and return the first card in the deck
        }
    }
}

// A class to represent a hand of cards
class Hand {
    var cards: [Card] // An array of cards in the hand

    // A constructor to initialize an empty hand
    init() {
        self.cards = []
    }

    // A method to add a card to the hand
    func add(card: Card) {
        self.cards.append(card) // Add the card to the hand
    }

    // A method to calculate the total value of the hand
    func total() -> Int {
        var sum = 0 // Initialize the sum to zero
        var aceCount = 0 // Initialize the ace count to zero
        // Loop through each card in the hand
        for card in self.cards {
            sum += card.value // Add the card value to the sum
            if card.rank == "ace" { // If the card is an ace, increment the ace count
                aceCount += 1
            }
        }
        // Loop through each ace in the hand
        for _ in 0..<aceCount {
            if sum + 10 <= 21 { // If adding 10 to the sum does not exceed 21, do so
                sum += 10 
            } else { 
                break // Otherwise, stop looping 
            }
        }
        return sum // Return the sum as the total value of the hand
    }

    // A method to check if the hand is busted (over 21)
    func busted() -> Bool {
        return self.total() > 21 // Return true if the total value is over 21, false otherwise
    }
}
//To implement the game, you need to create a deck object and shuffle it. Then you need to create a hand object for the player and a hand object for the dealer. You need to deal two cards to each hand and display them. You need to ask the player if they want to hit (get another card) or stand (stop getting cards). If the player hits, you need to deal another card to their hand and check if they are busted. If the player stands, you need to deal cards to the dealer’s hand until their total value is at least 17 or they are busted. Then you need to compare the total values of both hands and determine the winner. You need to repeat this process until the player wants to quit or the deck runs out of cards.