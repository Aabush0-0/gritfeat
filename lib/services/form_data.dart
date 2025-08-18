import 'package:dio/dio.dart';
import 'package:my_app/core/networks/api_services.dart';

Future<String> sendFormData({
  required String title,
  required String body,
  required int userId,
}) async {
  try {
    final formData = FormData.fromMap({
      "title": title,
      "body": body,
      "userId": userId,
    });

    final response = await ApiServices.dio.post(
      "posts",
      data: formData,
      options: Options(headers: {"Content-Type": "multipart/form-data"}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "FormData sent successfully! ID: ${response.data['id']}";
    } else {
      return "Error: ${response.statusCode}";
    }
  } on DioException catch (e) {
    return "Dio error: ${e.response?.data ?? e.message}";
  } catch (e) {
    return "Unexpected error: $e";
  }
}
