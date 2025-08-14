import 'package:flutter/material.dart';
import 'package:my_app/services/form_data.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  bool isLoading = false;
  String responseMessage = "";

  void sendPost() async {
    // Check if fields are empty
    if (titleController.text.trim().isEmpty ||
        bodyController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title and Body cannot be empty!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return; // stop execution
    }

    setState(() {
      isLoading = true;
      responseMessage = "Sending post...";
    });

    var response = await sendFormData(
      title: titleController.text,
      body: bodyController.text,
      userId: 1,
    );

    setState(() {
      isLoading = false;
      responseMessage = response;
    });

    // Show snackbar if successful
    if (response.toLowerCase().contains("success")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Post sent successfully!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to send post: $response"),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : sendPost,
              child:
                  isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Send Post"),
            ),
            const SizedBox(height: 20),
            Text(
              responseMessage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
