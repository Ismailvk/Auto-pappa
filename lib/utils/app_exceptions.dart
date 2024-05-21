class AppExceptions implements Exception {
  final String message;

  AppExceptions({required this.message});
}

class InterntExceptions extends AppExceptions {
  InterntExceptions() : super(message: 'No internet connection');
}

class BadRequestExceptions extends AppExceptions {
  BadRequestExceptions() : super(message: 'Somethig Went Wrong');
}

class RequestTimeOutExceptions extends AppExceptions {
  RequestTimeOutExceptions({required String errroMessage})
      : super(message: errroMessage);
}
