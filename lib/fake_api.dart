import 'dart:math' show Random;

const int _kLatencyInMilliseconds = 600;

/// Fake asynchronous server API methods.
class FakeServerApi {
  /// Fake authentication that succeeds or fails randomly.
  static Future<bool> authenticate(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: _kLatencyInMilliseconds));
    return Random().nextBool();
  }
}
