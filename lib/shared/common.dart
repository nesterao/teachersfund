String? requiredValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Field is required';
  }
  return null;
}

String? phoneNumberValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Field is required';
  } else if (text.length < 10) {
    return 'Enter a 10 digit phone number';
  }
  return null;
}

String? fourDigitValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Field is required';
  } else if (text.length < 4) {
    return 'Enter a 4 digit code';
  }
  return null;
}

String? passcodeValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Field is required';
  } else if (text.length < 6) {
    return 'Enter a 6-8 digit passcode';
  }
  return null;
}
