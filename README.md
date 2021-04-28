# Weather App :sunny: :cloud:

Weather App is a Swift app to show the weather in Paris for the next 5 days

## Installation :hammer:

You need to have installed CocoaPods on your computer

```bash
gem install cocoapods
```

And after that, you have to install all pods to execute the project

```bash
pod install
```

## Functionallity :blue_book:

Weather App contains two screens. 

The first one shows the most repeated weather by day 

The second one shows a collection with time slots and allows to select and see all information.

## Architecture :triangular_ruler:

The architecture chosen has been VIPER because
- VIPER provides a clean architecture
- All layers are testable
- The structure can be easily understandable
- The modules are easy to replicate

## Storage and Network :satellite:

The weather app has a small storage system that saves the data into a file in each download. So any time that a user opens the app and requests new data, it should be saved.
With that, if the device doesn't have reachability or if the API doesn't work, when the user opens the app, file data would be shown.

## First screen logic :pill:

The API returns to us many time slots with his weather, so for the first screen, Weather App shows the weather most frequent for this day. For instance

It's 28, April, and the call returns to us for this day 4 slots: Sunny, Cloudy, Raining, Cloudy.
In that case, the weather shown should be Cloudy because if the most frequent for 28, April

## Next steps :green_book:

- [ ] Search bar to introduce location
- [ ] Search more days
- [ ] Option to change units
- [ ] Improve design
