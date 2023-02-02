### Introduction
This project is an example that showcases the use of pagination in a list with BLOC architecture for communication and state management. It serves as an illustration of how to implement pagination in a Flutter project using the BLOC pattern.

### Requirements
Latest version of Flutter

### Project structure
The project is built using the MVVM architecture. The file structure is as follows:

```dart
lib
  app
    data
      data_providers
        remote
        local
      repositories
    domain
      constants
      data
        remote_providers
        repositories
      models
    presentation
      screens
        list_screen
          components
          logic
          list_screen.dart
  app.dart
  main.dart
```

### How to runHow to run
To run this project, simply follow the steps to run a normal Flutter application:

1. Clone the repository: git clone https://github.com/[your-username]/[repo-name].git
2. Change into the project directory: cd [repo-name]
3. Install the dependencies: flutter pub get
4. Run the app on an emulator or connected device: flutter run
5. State management techniques
6. The BLOC package is used for state management in this project.

### Application Snippet
```dart
class PaginationApp extends StatelessWidget {
  const PaginationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PassengerRepository>(
          create: (context) => PassengerRepositoryImpl(
            passengerApi: PassengerApiImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Pagination',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListScreen(),
      ),
    );
  }
}
```

### Contributions
If you'd like to contribute to this project, please follow these guidelines:

1. Fork the repository.
2. Create a branch for your changes.
3. Submit a pull request.

Your contribution is greatly appreciated!
