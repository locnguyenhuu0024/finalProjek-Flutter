abstract class StringValidator{
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator{
  @override
  bool isValid(String value){
    return value.isNotEmpty;
  }
}

class PhoneFormatValidator implements StringValidator{
  @override
  bool isValid(String value){
    return RegExp(r'(84|0[3|5|7|8|9])+([0-9]{8})\b$').hasMatch(value.toString());
  }
}

//(84|0[3|5|7|8|9])+([0-9]{8})\b

class InputValidator{
  final StringValidator evaluateEmptyValidator = NonEmptyStringValidator();
  final StringValidator phoneEmptyValidator = NonEmptyStringValidator();
  final StringValidator nameEmptyValidator = NonEmptyStringValidator();
  final StringValidator phoneFormatValidator = PhoneFormatValidator();
  final StringValidator emailEmptyValidator = NonEmptyStringValidator();
  final StringValidator passwordEmptyValidator = NonEmptyStringValidator();
}