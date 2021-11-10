<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# Color Tools
![Flutter CI](https://github.com/Ocell-io/color-tools/actions/workflows/main.yml/badge.svg)  
Color Tools is a library that provies ulitlity functions for the flutter Color class. In comparison to other libaries it tries to avoid adding additonal classes where possible.

## Features

* create Color from names
* create Color from color codes
* convert Colors to various types of Strings
* lighten a color
* darken a color
* saturate a color
* desaturate a color
* and more


## Getting started
color_tools provides options to load colors via ColorFrom and add various extensions to the Color class to make it more user friendly.


```dart
import 'package:color_tools/color_tools.dart';

final code = ColorFrom.name('red').toCode();
assert(code == '#ff0000')
```

## Usage

Create a color from a name
```dart
final color = ColorFrom.name('red');
```

Create a color from a color code
```dart
final color = ColorFrom.code('#ff0000');
```

Generate a specific color from an object. Useful for creating colors for other objects (usernames).
```dart
final someObject = "does not have to be a string!";
final color = ColorFrom.object(someObject);

//called for the same object it always gives the same result
assert(ColorFrom.object(someObject) == ColorFrom.object(someObject)) ;

//you can limit the range of possible colors
ColorFrom.object(someObject,
    hueLowerLimit: 40, valueLowerLimit: 1, saturationUpperLimit: 1),

```

Lighten a color
```dart
final color = Colors.red.lighten();
```

Saturate a color
```dart
final color = Colors.red.saturate();
```
