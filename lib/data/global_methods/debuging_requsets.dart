import 'dart:developer';

void debugApi({
  required String methodName,
  required int statusCode,
  required response,
  required data,
  required String endPoint,
  headers,
}) {
  log(
    "methode: $methodName\n"
        "URL: $endPoint\n "
        "statusCode: $statusCode\n"
        "${response != null ? 'Response: $response\n' : ''}"
        "${data != null ? 'data: $data\n' : ''}"
        "${headers != null ? 'headers: $headers\n' : ''}"
        "--------------------",
  );
}
