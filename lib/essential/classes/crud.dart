//create record upodate delete
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fexercise/essential/classes/status_request.dart';
import 'package:fexercise/essential/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud{

  //we cant use only MAP becuase we are getting information from the backend so errors will happen
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async{
    
    try{
        //check internet connection
      if(await checkInternet())
      {
        //if there is connection
        var response = await http.post(Uri.parse(url), body: data);
        if(response.statusCode == 200 || response.statusCode == 201)
        {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
        //if connection is working and still application not working then server error
        else
        {
          return const Left(StatusRequest.serverFailure);
        }
      }
      //internet connection failed
      else
      {
        return const Left(StatusRequest.connectionFailure);
      }
    }
    catch(_){
      return const Left(StatusRequest.serverFailure);
    }
  }
}