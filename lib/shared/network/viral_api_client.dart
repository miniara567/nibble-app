import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import 'models/recipe_dto.dart';
import 'models/submission_dto.dart';

final dioProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    responseType: ResponseType.json,
  );
  final dio = Dio(options);
  dio.interceptors.add(LogInterceptor(
    requestBody: false,
    responseBody: false,
  ));
  return dio;
});

class ViralApiClient {
  ViralApiClient({
    required this.dio,
    required this.baseUrl,
  });

  final Dio dio;
  final String baseUrl;

  Future<RecipeCollectionDto> fetchRecipes({
    int limit = 20,
    String? cursor,
    String? tag,
    String? platform,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '$baseUrl/recipes',
      queryParameters: {
        'limit': limit,
        if (cursor != null) 'cursor': cursor,
        if (tag != null) 'tag': tag,
        if (platform != null) 'platform': platform,
      },
    );
    return RecipeCollectionDto.fromJson(response.data ?? const {});
  }

  Future<RecipeDto> fetchRecipeDetail(String id) async {
    final response = await dio.get<Map<String, dynamic>>('$baseUrl/recipes/$id');
    return RecipeDto.fromJson(response.data ?? const {});
  }

  Future<RecipeTranscriptDto> fetchTranscript(String id) async {
    final response =
        await dio.get<Map<String, dynamic>>('$baseUrl/recipes/$id/transcript');
    return RecipeTranscriptDto.fromJson(response.data ?? const {});
  }

  Future<SubmissionDto> submitVideo({
    required String videoUrl,
    String? contactEmail,
    String? notes,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '$baseUrl/submissions',
      data: {
        'videoUrl': videoUrl,
        if (contactEmail != null) 'contactEmail': contactEmail,
        if (notes != null) 'notes': notes,
      },
    );
    return SubmissionDto.fromJson(response.data ?? const {});
  }

  Future<SubmissionDto> getSubmissionStatus(String id) async {
    final response = await dio.get<Map<String, dynamic>>('$baseUrl/submissions/$id');
    return SubmissionDto.fromJson(response.data ?? const {});
  }
}
