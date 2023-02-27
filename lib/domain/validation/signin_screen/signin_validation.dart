mixin InputValidationMixin {
  bool isPasswordValid(String password) {
    if (password.length >= 8) {
      return true;
    } else if (password.length <= 12) {
      return false;
    }
    return false;
  }

  bool isEmailValid(String email) {
    // String pattern =
    //     '^(([^<>()[]\\.,;:s@"]+(.[^<>()[]\\.,:s@"]+)*)|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))';
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);

    // if (email.contains(RegExp('@')) && email.contains(RegExp('.'))) {
    //   return true;
    // }
    // return false;
  }

  bool isMobileNumValid(String mobile) {
    RegExp regex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return regex.hasMatch(mobile);
  }
}
