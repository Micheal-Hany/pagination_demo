# Pagination with JSON Serialization in Flutter

This Flutter subproject demonstrates how to implement pagination with JSON serialization using the [Dio](https://pub.dev/packages/dio) package for HTTP requests and the [json_serializable](https://pub.dev/packages/json_serializable) package for JSON serialization/deserialization.

## Features

- **Pagination**: Fetches data from an API in a paginated manner, loading more data as the user scrolls.
- **JSON Serialization**: Utilizes the [json_serializable](https://pub.dev/packages/json_serializable) package to serialize and deserialize JSON data into Dart objects.
- **Bloc Pattern**: Implements state management using the Cubit from the [flutter_bloc](https://pub.dev/packages/flutter_bloc) package for a clean and reactive architecture.
- **Explicit JSON Serialization**: Uses the `explicitToJson: true` option in the @JsonSerializable annotation to explicitly convert nested objects to JSON.

## How to Use

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Micheal-Hany/pagination_demo.git
   
## 📱 UI


## 🛠 Dependencies
flutter_bloc: ^8.0.0
dio: ^4.0.0
