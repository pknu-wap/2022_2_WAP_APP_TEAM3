import 'package:validators/validators.dart';

Function validateStudentNumber() {
  return (String? value) {
    if (value!.isEmpty)
      return "학생번호를 입력해주세요.";
    else if (value.length != 9)
      return "학생번호는 9자리 입니다.";
  };
}
Function validatePassWord() {
  return (String? value) {
    if (value!.isEmpty)
      return "비밀번호를 입력해주세요.";
    else if (value.length < 8)
      return "비밀번호는 8자리 이상으로 설정해주세요.";
    else if (value.length > 15)
      return "비밀번호는 15자리 이하로 설정해주세요.";
    else
      return null;
  };
}
Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty)
      return "이메일을 입력해주세요.";
    else if(!isEmail(value))
      return "이메일 형식에 맞지 않습니다.";
    else
      return null;
  };
}
Function validatePhone() {
  return (String? value) {
    if (value!.isEmpty)
      return "전화번호를 입력해주세요.";
    else if(value.length != 11)
      return "전화번호를 올바르게 입력해주세요.";
    else
      return null;
  };
}
Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty)
      return "제목을 작성해주세요.";
    else if(value.length < 5)
      return "5글자 이상 입력해주세요.";
    else if(value.length > 30)
      return "제목의 길이를 초과하였습니다.";
    else
      return null;
  };
}
Function validateContents() {
  return (String? value) {
    if (value!.isEmpty)
      return "내용을 작성해주세요.";
    else if(value.length < 5)
      return "5글자 이상 입력해주세요.";
    else if(value.length > 500)
      return "500글자를 초과할 수 없습니다.";
    else
      return null;
  };
}