mixin InputValidationMixin {
  String? isValid(String? value) {
    return value?.trim().isNotEmpty ?? false 
      ? null
      : "Cannot be empty";
  }
}