enum AuthResultStatus{
  successful,
  emailAlreadyExists,
  worngPassword,
  invalidEmail,
  userNotFound,
  userDisbled,
  operationNotAllowed,
  toManyRequests,
  undefined,
  weakPassword,
}

class AuthExceptionHandler{

  static handleException(e){
    final AuthResultStatus status;
    switch(e.code){
      case "invalid-email":status= AuthResultStatus.invalidEmail;
      break;
       case "user-not-foound":status= AuthResultStatus.userNotFound;
      break;
       case "invalid-disbaled-field":status= AuthResultStatus.userDisbled;
      break;
       case "too-many-request":status= AuthResultStatus.toManyRequests;
      break;
       case "weak-password":status= AuthResultStatus.weakPassword;
      break;
       case "worng-password":status= AuthResultStatus.worngPassword;
      break;
       case "operation-not-allowed":status= AuthResultStatus.operationNotAllowed;
      break;
       case "email-already-in-use":status= AuthResultStatus.emailAlreadyExists;
      break;
      default:status=AuthResultStatus.undefined;


    }
    return status;
  }


  // 
  // accepts authenticationhandler error type
  // 
  static generateExpetionMessage(exceptionCode){
    String errorMessage;
    switch(exceptionCode){
      case AuthResultStatus.invalidEmail:
      errorMessage = "your email address invalid";
      break;
       case AuthResultStatus.worngPassword:
      errorMessage = "your password is wrong";
      break;
       case AuthResultStatus.userNotFound:
      errorMessage = "user with this email doesn't exist";
      break;
       case AuthResultStatus.userDisbled:
      errorMessage = "user with this email address has been disabled ";
      break;
       case AuthResultStatus.toManyRequests:
      errorMessage = "too many request, try again later";
      break;
       case AuthResultStatus.weakPassword:
      errorMessage = "your passwrod is too weak";
      break;
       case AuthResultStatus.operationNotAllowed:
      errorMessage = "sign in with email and password is not enabled";
      break;
       case AuthResultStatus.emailAlreadyExists:
      errorMessage = "email is already registered,";
      break;
      default:errorMessage = "An undefined error happened";
    }
    return errorMessage;
    }
    }
 