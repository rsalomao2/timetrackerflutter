abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

mixin EmailAndPassowrdValidator {
  final errorText = "Not empty";
  final StringValidator emailValidator = NonEmptyValidator();
  final StringValidator passwordValidator = NonEmptyValidator();
}
