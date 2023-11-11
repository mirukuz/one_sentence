import 'package:flutter/material.dart';
import './settings/settings_view.dart';

class TranslationView extends StatefulWidget {
  static const routeName = '/translation';

  @override
  _TranslationViewState createState() => _TranslationViewState();
}

class _TranslationViewState extends State<TranslationView> {
  TextEditingController _translationController = TextEditingController();
  String _feedback = '';

  void _submitTranslation() {
    // Call your API here and update the feedback based on the response
    // For example, you can replace the following line with your API call
    // and handle the response accordingly.
    // You can also show loading indicators while waiting for the API response.
    _feedback = 'Translation submitted: ${_translationController.text}';
    setState(() {
      // Update UI based on API response
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Prompt
            Text(
              'Translate the following sentence:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Input box for translation
            TextField(
              controller: _translationController,
              decoration: InputDecoration(
                labelText: 'Your Translation',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: _submitTranslation,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),

            // Feedback section
            Text(
              _feedback,
              style: TextStyle(fontSize: 16, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
