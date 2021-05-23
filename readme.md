# WechselStube

WechselStube is a currency converter app built with SwiftUI and using a redux-like container (see [here](https://swiftwithmajid.com/2019/09/18/redux-like-state-container-in-swiftui/) and [here](https://danielbernal.co/redux-like-architecture-with-swiftui-basics/)).

- [x] To fetch currencies, get your free API key from here: [https://currencylayer.com/documentation](https://currencylayer.com/documentation)
- [x] Currency and amount can be selected
- [x] Displays a list of exchange rates
- [x] Currencies are cached and loaded if less than 30 minutes old
- [x] Includes some unit tests

## TODO:
There is little networking code for simplicity sake and lack of time.

- [ ] Error handling
- [ ] mockable URLSession
