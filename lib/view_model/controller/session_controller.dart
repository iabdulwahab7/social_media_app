class SessionController {
  //singleton class for safety
  static final SessionController _session = SessionController._internal();

  String? userId;
  factory SessionController() {
    return _session;
  }

  SessionController._internal() {}
}
