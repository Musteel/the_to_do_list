// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextListScreen(),
    );
  }
}

class TextListScreen extends StatefulWidget {
  const TextListScreen({super.key});

  @override
  _TextListScreenState createState() => _TextListScreenState();
}

class _TextListScreenState extends State<TextListScreen> {
  List<String> textList = [];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add item to the ToDo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            // Textfield to enter the text
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter ToDo Item',
              ),
              onSubmitted: (value) {
                setState(() {
                  textList.add(value);
                  textController.clear();
                });
              },
            ),
          ),
          // Button to add the text to the list
          ElevatedButton(
            onPressed: () {
              setState(() {
                textList.add(textController.text);
                textController.clear();
              });
            },
            child: const Text('Add Item'),
          ),
          // List of the text
          Expanded(
            child: ListView.builder(
              itemCount: textList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(textList[index]),
                  // Delete the text from the list
                  onTap: () {
                    String selectedText = textList[index];
                    setState(() {
                      textList.removeAt(index);
                      textController.text = selectedText;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}