```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // Check for required keys before accessing them
        if (jsonData is Map && jsonData.containsKey('name')) {
          final String name = jsonData['name'];
          print(name);
        } else {
          print('Error: JSON response does not contain the expected key: name');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('Error: Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```