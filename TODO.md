# The Challenge
The challenge is to write an application which interacts with the currencylayer API and at least one other API to send the output to anything else but the console (think of mail, text message, slack, tweet etc. - Suprise us!). The application itself should be implemented in Ruby. Feel free to use any generic gems you might require apart-from currencylayer-related gems. Instead, the JSON API calls and related handling should be implemented by you.

## TODO
- [ ] Return the exchange rate(s) of a given base currency into one or more target currencies
  - It should also be possible to get the Exchange Rate on a specific Date
- [ ] Return the Value of a given base currency (such as "EUR"), a given Value (such as "1.23") into one or multiple target currencies.
  - It should also be possible to get the Value on a specific Date
- [ ] Return the best exchange rate (highest) and the corresponding date of the last seven days for a given base and a given target currency
