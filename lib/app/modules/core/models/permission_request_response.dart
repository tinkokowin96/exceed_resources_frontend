class PermissionRequestResponse {
  final bool granted;
  final String? message;

  const PermissionRequestResponse({required this.granted, this.message});
}
