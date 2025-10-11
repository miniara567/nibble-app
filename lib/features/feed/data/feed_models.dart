import 'package:equatable/equatable.dart';

class RecipeSummary extends Equatable {
  const RecipeSummary({
    required this.id,
    required this.title,
    required this.summary,
    required this.heroImageUrl,
    required this.platform,
    required this.confidence,
    required this.tags,
    required this.durationSeconds,
    required this.viewCount,
  });

  final String id;
  final String title;
  final String summary;
  final String heroImageUrl;
  final String platform;
  final double confidence;
  final List<String> tags;
  final int? durationSeconds;
  final int? viewCount;

  @override
  List<Object?> get props => [
        id,
        title,
        summary,
        heroImageUrl,
        platform,
        confidence,
        tags,
        durationSeconds,
        viewCount,
      ];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'summary': summary,
        'heroImageUrl': heroImageUrl,
        'platform': platform,
        'confidence': confidence,
        'tags': tags,
        'durationSeconds': durationSeconds,
        'viewCount': viewCount,
      };

  factory RecipeSummary.fromJson(Map<String, dynamic> json) => RecipeSummary(
        id: json['id'] as String,
        title: json['title'] as String,
        summary: json['summary'] as String,
        heroImageUrl: json['heroImageUrl'] as String,
        platform: json['platform'] as String,
        confidence: (json['confidence'] as num).toDouble(),
        tags: (json['tags'] as List<dynamic>).cast<String>(),
        durationSeconds: json['durationSeconds'] as int?,
        viewCount: json['viewCount'] as int?,
      );
}

class FeedPage {
  FeedPage({
    required this.items,
    required this.nextCursor,
  });

  final List<RecipeSummary> items;
  final String? nextCursor;

  Map<String, dynamic> toJson() => {
        'items': items.map((item) => item.toJson()).toList(),
        'nextCursor': nextCursor,
      };

  factory FeedPage.fromJson(Map<String, dynamic> json) => FeedPage(
        items: (json['items'] as List<dynamic>)
            .map((node) => RecipeSummary.fromJson(
                  node as Map<String, dynamic>,
                ))
            .toList(),
        nextCursor: json['nextCursor'] as String?,
      );
}

class FeedFailure implements Exception {
  FeedFailure(this.message);

  final String message;

  @override
  String toString() => 'FeedFailure($message)';
}
