# Moroccan cities utility for Dart/Flutter

This package represents a utility package for accessing the data of all cities & regions in Morocco, so you can have the option to use it in your app directly without having to search for it or loading it from a remote source via an http request as an example.

<br>
## Why this package?

 - This package doesn't require you to load the data from a remote source, so you can use it directly in your app without having to wait for a network request to finish.

 - This package offers both `Future` and `Stream` functionalities for getting all data resources, so you can get items as they are ready and listen to them via a `StreamBuilder`... or you can wait until all resources are ready and use it with a `FutureBuilder`...

 - The computation happening for loading and modeling the data in this package happens in a separate `Isolate`, so you can guarantee a seamless and smooth experience in your Flutter app UI.

<br>

## Usage
#### Cities

For getting all Morocco cities as a `Stream<MorrocanCity>`:
```dart
Stream<MorrocanCity> citiesStream = MoroccanCities.instance.citiesStream();

citiesStream.listen((city) {
   print(city.name); // ...
});

```

For getting all Morocco cities as a final `List<MorrocanCity>`:
```dart
List<MorrocanCity> cities = await MoroccanCities.instance.cities();
print(cities); // ...
print(cities.first.name); // ...
```

<br>

#### Regions
For getting all Morocco regions as a `Stream<MorrocanRegion>`:
```dart
Stream<MorrocanRegion> regionsStream = MoroccanCities.instance.regionsStream();

regionsStream.listen((region) {
   print(region.name); // ...
});

```


For getting all Morocco regions as a final `List<MorrocanRegion>`:
```dart
List<MorrocanRegion> regions = await MoroccanCities.instance.regions();
print(regions); // ...
print(regions.first.name); // ...
```


<br>

#### Cities by region
For getting all Morocco cities by region as a `Stream<MorrocanCity>`:
```dart
final regions = await MoroccanCities.instance.regions();
Stream<MorrocanCity> citiesByRegionStream = MoroccanCities.instance.citiesByRegionStream(regions.first);

citiesByRegionStream.listen((city) {
   print(city.name); // ...
});

```

For getting all Morocco cities by region as a final `List<MorrocanCity>`:
```dart
final regions = await MoroccanCities.instance.regions();
List<MorrocanCity> citiesByRegion = await MoroccanCities.instance.citiesByRegion(regions.first);
print(citiesByRegion); // ...
print(citiesByRegion.first.name); // ...
```

<br>

#### Contributing
If you want to contribute to this package, you can do so by creating a pull request and I'll be happy to review it and merge it if it's good to go, this package is made to offer help for moroccan developers who want to use it in their apps, so any contribution is welcome.

<br>

#### License
This package is licensed under the MIT license, so you can use it in your apps without any restrictions.

