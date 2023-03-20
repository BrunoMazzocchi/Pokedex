# Pokedex

This is a Flutter based Pokedex app. It uses the [PokeAPI](https://pokeapi.co/) to fetch the data.

## Screen
<h1 align="center">

<img src="https://user-images.githubusercontent.com/68037905/226382707-9ecf8470-3a60-43a8-a997-3322deb48274.png" width="170" height="350"/>
<img src="https://user-images.githubusercontent.com/68037905/226382815-2b808ce0-afa9-46fd-98ba-603361ceb1c4.png" height="350"/>
<img src="https://user-images.githubusercontent.com/68037905/226382894-e715cee0-dc58-469a-aec4-71977cab7f45.png" height="350"/>
</h1>

## Dependencies

- [Flutter](https://flutter.dev/) is a open source framework base on Google's Dart programming language to improve the development time between cross-platform devices. 
- [Http](https://pub.dev/packages/http) will make possible to fetch data from an REST API. 
- [Test](https://pub.dev/packages/test), it is important to make sure that all classes and methods  are working properly. Test will provide the methods to do it. 
- [Mockito](https://pub.dev/packages/mockito) provides a simple and powerful API for creating mock objects and defining their behavior.
- [Build Runner](https://pub.dev/packages/build_runner) is a an automated code generator. I'm using in this app to generate the multi language support (EN and ES), depending on the device language. 
- [Json Serializable](https://pub.dev/packages/json_serializable) allow us to convert fetched data (json) into a dart class. You'll be able to appreciate it in the poke api client in packages/poke_client/src/models.
- [Bloc](https://pub.dev/packages/bloc)
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) with BLoC, it makes easier to manage the state of the application and handle it. 
- [Equatable](https://pub.dev/packages/equatable) It is a code generation library that helps developers to easily define the equality between objects based on their values rather than their identity.
- [intl](https://pub.dev/packages/intl) package that provides several classes to handle different aspects of the internationalization. 
- [Google Fonts](https://pub.dev/packages/google_fonts) to select the specific font in the MaterialApp widget. 
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons) to generate the app icon.
