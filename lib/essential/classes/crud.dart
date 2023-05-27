import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:fexercise/essential/classes/status_request.dart';

import '../functions/check_internet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      //check internet connection
      if (await checkInternet()) {
        //if there is connection
        var response = await http.post(Uri.parse(url), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.connectionFailure);
        }
      } else {
        return const Left(StatusRequest.connectionFailure);
      }
    } on SocketException catch (_) {
      // if there is no internet connection
      return const Left(StatusRequest.connectionFailure);
    } catch (e) {
      // if any other error occurred
      return const Left(StatusRequest.serverFailure);
    }
  }
}
