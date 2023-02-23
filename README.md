# Pokedex

This is a Flutter based Pokedex app. It uses the [PokeAPI](https://pokeapi.co/) to fetch the data.

## Screen
<h1 align="center">

<img src="https://user-images.githubusercontent.com/68037905/221052680-1e0b181d-938a-4e7b-81f2-635d6bfa20e0.png" width="170" height="350"/>
<img src="https://user-images.githubusercontent.com/68037905/221052684-7b33a8be-f69a-41ff-8136-bd57a8526547.png" height="350"/>
<img src="https://user-images.githubusercontent.com/68037905/221052687-e6574cf6-0051-4666-9ffb-f2c3597c3e12.png" height="350"/>
<img src="https://user-images.githubusercontent.com/68037905/221052924-458ec86e-5bee-47aa-9ab0-2e77bcbb9155.gif" height="350"/>

</h1>

## Dependencies

- [Flutter](https://flutter.dev/) is a open source framework base on Google's Dart programming language to improve the development time between crossplatform devices. 
- [Http](https://pub.dev/packages/http) will make possible to fetch data from an REST API. 
- [Test](https://pub.dev/packages/test), it is important to make sure that all classes and methods  are working properly. Test will provide the methods to do it. 
- [Mockito](https://pub.dev/packages/mockito) provides a simjple and powerful API for creating mock objects and defining their behavior.
- [Build Runner](https://pub.dev/packages/build_runner) is a an automated code generator. I'm using in this app to generate the multi language support (EN and ES), depending on the device language. 
- [Json Serializable](https://pub.dev/packages/json_serializable) allow us to convert fetched data (json) into dart classe. You'll be able to appreciate it in the poke api client in packages/poke_client/src/models.
- [Bloc](https://pub.dev/packages/bloc)
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) with BLoC, it makes easier to manage the state of the application and handle it. 
- [Equatable](https://pub.dev/packages/equatable) It is a code generation library that helps developers to easily define the equality between objects based on their values rather than their identity.
- [intl](https://pub.dev/packages/intl) package that provides several classes to handle different aspects of the internationalization. 
- [Google Fonts](https://pub.dev/packages/google_fonts) to select the specific font in the MaterialApp widget. 
