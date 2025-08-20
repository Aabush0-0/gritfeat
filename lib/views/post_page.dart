import 'package:flutter/material.dart';
import 'package:my_app/core/networks/api_services.dart';
import 'package:my_app/services/form_data.dart';
import 'package:my_app/models/post_model.dart';
import 'package:my_app/services/create_post_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final ValueNotifier<List<Post>> postsNotifier = ValueNotifier([]);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(true);
  final ValueNotifier<String> formDataResponseNotifier = ValueNotifier(
    'FormData not sent yet',
  );

  @override
  void initState() {
    super.initState();
    fetchPosts();
    loadFormData();
  }

  Future<void> loadFormData() async {
    formDataResponseNotifier.value = "Sending FormData...";
    final response = await sendFormData(
      title: 'Title',
      body: 'body',
      userId: 1,
    );
    formDataResponseNotifier.value = response;
  }

  Future<void> fetchPosts() async {
    try {
      final response = await ApiServices.dio.get('posts');

      if (response.data is List) {
        postsNotifier.value =
            (response.data as List).map((json) => Post.fromJson(json)).toList();
      } else {
        postsNotifier.value = [];
      }
    } catch (e) {
      postsNotifier.value = [];
      Future.microtask(() {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed to fetch posts: $e"),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    } finally {
      isLoadingNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts & FormData')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<String>(
              valueListenable: formDataResponseNotifier,
              builder: (context, response, _) {
                return Card(
                  color: Colors.blue.shade50,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      response,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Posts Section
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: isLoadingNotifier,
              builder: (context, isLoading, _) {
                if (isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ValueListenableBuilder<List<Post>>(
                  valueListenable: postsNotifier,
                  builder: (context, posts, _) {
                    if (posts.isEmpty) {
                      return const Center(
                        child: Text(
                          "No posts available.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User ID: ${post.userId}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'ID: ${post.id}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  post.title,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(post.body),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage()),
          );
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
