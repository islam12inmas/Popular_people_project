Uri getUri(String endpoint, {Map<String, String>? params}) {
  Uri uri = Uri.parse(endpoint);
  if (params != null) uri = uri.replace(queryParameters: params);
  return uri;
}