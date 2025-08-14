import 'package:flutter/material.dart';
import 'package:my_app/services/dio_client.dart';
import 'package:my_app/services/form_data.dart';
import 'package:my_app/services/post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // ValueNotifiers for data and loading
  final ValueNotifier<List<Post>> postsNotifier = ValueNotifier([]);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(true);

  //formData response
  final ValueNotifier<String> formDataResponseNotifier = ValueNotifier(
    'Sending FormData ...',
  );

  @override
  void initState() {
    super.initState();
    fetchPosts();
    loadFormData();
  }

  Future<void> loadFormData() async {
    var response = await sendFormData(title: 'Title', body: 'body', userId: 1);
    formDataResponseNotifier.value = response.toString();
  }

  void fetchPosts() async {
    try {
      var response = await DioClient.dio.get('posts');

      if (response.data is List) {
        postsNotifier.value =
            (response.data as List).map((json) => Post.fromJson(json)).toList();
      } else {
        postsNotifier.value = [];
      }
    } catch (e) {
      print('Error fetching posts: $e');
      postsNotifier.value = [];
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
          // Show FormData response
          ValueListenableBuilder<String>(
            valueListenable: formDataResponseNotifier,
            builder: (context, response, _) {
              return Text(
                response,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              );
            },
          ),

          // Posts list
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
    );
  }
}
