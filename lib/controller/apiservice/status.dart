class Success {
  int? code;
  String? responseMsg;
  Object? response;
  Success({
    this.code,
    this.response,
    this.responseMsg,
  });
}

class Failures {
  int? code;
  String? responseMsg;

  Object? errrorResponse;
  Failures({
    this.code,
    this.errrorResponse,
    this.responseMsg,
  });
}
