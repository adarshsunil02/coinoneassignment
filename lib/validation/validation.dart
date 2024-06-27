class Validator{

  // empty text validation
static String? validateEmptytext(  String? value){
  if(value==null||value.isEmpty){
    return 'name is required';
  }
  return null;
} 

// email validation
static String? validateEmail(String? value){
  if(value==null||value.isEmpty){
    return "email is required";
  }
  final emailRegExp=RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  if(!emailRegExp.hasMatch(value)){
    return 'invalid email address';
  }
return null;

}

// password validation

static String? validatePassword(String? value){
  if(value==null||value.isEmpty){
    return 'password is required';

  }
       //validate length 
  if(value.length<6){
    return 'password must be at least 6 characters ';
  }
      //validate uppercase
  if(!value.contains(RegExp(r'[A-Z]'))) {
    return 'password must contain at least one uppercase letter';
  } 
      //check number
 if(!value.contains(RegExp(r'[0-9]'))){
  return 'password must contain at least one number';
 }
 if(!value.contains(RegExp(r'[!@#\$&*~]'))){
  return 'password must contain at least one spacial charaters';
 }
 return null;
}

// check phone number
static String? validateMobile(String? value) {
  if(value==null||value.isEmpty){
  return 'phone number is requried';
  }
    if (value.length != 10){
      return 'Mobile Number must be of 10 digit';

    }
    return null;

  }

// check confirm password
static String? confirmPassword(String? password, String? confirmPassword) {
  if (password == null || confirmPassword == null) {
    return 'Password and confirm password are required';
  }

  // Check if password and confirm password are empty
  if (password.isEmpty || confirmPassword.isEmpty) {
    return 'Password and confirm password cannot be empty';
  }

  // Check if password matches confirm password
  if (password != confirmPassword) {
    return 'Password and confirm password do not match';
  }

  return null; // Passwords match
}

}