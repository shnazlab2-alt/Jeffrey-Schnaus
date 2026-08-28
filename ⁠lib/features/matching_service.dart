// File: lib/features/matching/matching_service.dart
import 'anonymous_profile.dart';

enum MatchStatus { queued, active, revealed, expired }

class MatchingService {
  final String userId;

  MatchingService({required this.userId});

  String getDisplayAlias(String promptId) {
    return AnonymousProfile.generateAlias(userId, promptId);
  }
}
