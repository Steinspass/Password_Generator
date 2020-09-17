
var upperLetters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
var lowerLetters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
var numbers = ['1','2','3','4','5','6','7','8','9'];
var symbols = [ '!','@','#','%','^','&','*','(',')','_','+','='];


String generatorOfPassword({
  int totalLength,
  bool isUppercases,
  bool isLowercases,
  bool isNumbers,
  bool isSymbols
}){
  
  String password = '';
  List<String> passwordElement = List<String>();
  var concatenate = StringBuffer();

  if(isLowercases){
    passwordElement += _getLowercase();
  }

  if(isUppercases){
    passwordElement += _getUppercase();
  }

  if(isNumbers){
    passwordElement += _getNumbers();
    passwordElement += _getNumbers();
    passwordElement += _getNumbers();
    passwordElement += _getNumbers();
  }

  if(isSymbols){
    passwordElement += _getSymbols();
    passwordElement += _getSymbols();
    passwordElement += _getSymbols();
    passwordElement += _getSymbols();
  }

  if(passwordElement.isEmpty){
    return 'Password';
  }

  passwordElement.shuffle();

  passwordElement.length = totalLength;

  passwordElement.shuffle();

  passwordElement.forEach((element) { 

    concatenate.write(element);

   });

  password = concatenate.toString();

  return password;

}


List<String> _getLowercase(){

  lowerLetters.shuffle();
  lowerLetters.shuffle();
  lowerLetters.shuffle();


  return lowerLetters;
}

List<String> _getUppercase(){
  upperLetters.shuffle();
  upperLetters.shuffle();
  upperLetters.shuffle();

  
  return upperLetters;
}

List<String> _getNumbers(){
  numbers.shuffle();
  numbers.shuffle();
  numbers.shuffle();

  
  
  return numbers;
}

List<String> _getSymbols(){
  symbols.shuffle();
  symbols.shuffle();
  symbols.shuffle();
  
  return symbols;
}