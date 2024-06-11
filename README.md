Pagination with JSON Serialization in Flutter
This Flutter subproject demonstrates how to implement pagination with JSON serialization using the Dio package for HTTP requests and the json_serializable package for JSON serialization/deserialization.

Features
Pagination: Fetches data from an API in a paginated manner, loading more data as the user scrolls.
JSON Serialization: Utilizes the json_serializable package to serialize and deserialize JSON data into Dart objects.
Bloc Pattern: Implements state management using the Cubit from the flutter_bloc package for a clean and reactive architecture.
Explicit JSON Serialization: Uses the explicitToJson: true option in the @JsonSerializable annotation to explicitly convert nested objects to JSON.
How to Use
Clone this repository to your local machine:

bash
Copy code
git clone https://github.com/your_username/your_repository.git
Navigate to the project directory:

bash
Copy code
cd your_repository
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
Explore the paginated list of news sources and observe how more data is loaded as you scroll.

Dependencies
flutter_bloc: A predictable state management library that helps implement the Bloc pattern.
dio: A powerful HTTP client for Dart that supports interceptors, FormData, request cancellation, and more.
json_serializable: Generates code for converting to and from JSON by annotating Dart classes.
equatable: Simplifies equality comparisons for Dart objects.
Contributing
Contributions are welcome! Feel free to open issues or pull requests to suggest improvements or fix any bugs you encounter.

License
This project is licensed under the MIT License - see the LICENSE file for details.
