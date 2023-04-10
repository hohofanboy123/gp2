import 'dart:io';

checkInternet() async{

  try{
    var connection = await InternetAddress.lookup("google.com");
    if (connection.isNotEmpty && connection[0].rawAddress.isNotEmpty)
    {
      return true;
    }
  }
  on SocketException catch(_){
    return false;
  }
}