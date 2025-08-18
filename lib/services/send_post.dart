import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/networks/api_services.dart';
import 'package:my_app/core/networks/api_urls.dart';
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
  String tokenStatus = "Checking token...";

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    try {
      final response = await ApiServices.dio.get(
        'posts', // any protected endpoint
        options: Options(
          headers: {'Authorization': 'Bearer ${Urls.trefleToken}'},
        ),
      );

      setState(() {
        tokenStatus = "Token is valid! Status: ${response.statusCode}";
      });
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        setState(() {
          tokenStatus = "Token is invalid or expired";
        });
      } else {
        setState(() {
          tokenStatus = "Error checking token: ${e.message}";
        });
      }
    }
  }

  void sendPost() async {
    if (titleController.text.trim().isEmpty ||
        bodyController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title and Body cannot be empty!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
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

    if (response.toLowerCase().contains("success")) {
      titleController.clear();
      bodyController.clear();
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
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text("Create Post"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              tokenStatus,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(color: Colors.red),
                hintText: 'Enter post title',
                filled: true,
                fillColor: Colors.green.shade100,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                labelText: 'Body',
                labelStyle: const TextStyle(color: Colors.red),
                hintText: 'Enter post body',
                filled: true,
                fillColor: Colors.green.shade100,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : sendPost,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                backgroundColor: Colors.blue[300],
              ),
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
