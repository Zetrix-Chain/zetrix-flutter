import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sdk-exceptions.freezed.dart';

@freezed
abstract class ZetrixSDKExceptions with _$ZetrixSDKExceptions {
  const factory ZetrixSDKExceptions.requestCancelled() = RequestCancelled;

  const factory ZetrixSDKExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory ZetrixSDKExceptions.badRequest() = BadRequest;

  const factory ZetrixSDKExceptions.notFound(String reason) = NotFound;

  const factory ZetrixSDKExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory ZetrixSDKExceptions.notAcceptable() = NotAcceptable;

  const factory ZetrixSDKExceptions.requestTimeout() = RequestTimeout;

  const factory ZetrixSDKExceptions.sendTimeout() = SendTimeout;

  const factory ZetrixSDKExceptions.conflict() = Conflict;

  const factory ZetrixSDKExceptions.internalServerError() = InternalServerError;

  const factory ZetrixSDKExceptions.notImplemented() = NotImplemented;

  const factory ZetrixSDKExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory ZetrixSDKExceptions.noInternetConnection() = NoInternetConnection;

  const factory ZetrixSDKExceptions.formatException() = FormatException;

  const factory ZetrixSDKExceptions.unableToProcess() = UnableToProcess;

  const factory ZetrixSDKExceptions.defaultError(String error) = DefaultError;

  const factory ZetrixSDKExceptions.unexpectedError() = UnexpectedError;

  static ZetrixSDKExceptions getDioException(error) {
    if (error is Exception) {
      try {
        ZetrixSDKExceptions sdkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              sdkExceptions = const ZetrixSDKExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              sdkExceptions = const ZetrixSDKExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              sdkExceptions =
                  const ZetrixSDKExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              switch (error.response!.statusCode) {
                case 400:
                  sdkExceptions = ZetrixSDKExceptions.defaultError(error
                      .response!.data['messages'].first['message']
                      .toString());

                  break;
                case 401:
                  sdkExceptions =
                      const ZetrixSDKExceptions.unauthorisedRequest();
                  break;
                case 403:
                  sdkExceptions =
                      const ZetrixSDKExceptions.unauthorisedRequest();
                  break;
                case 404:
                  sdkExceptions =
                      const ZetrixSDKExceptions.notFound("Not found");
                  break;
                case 409:
                  sdkExceptions = const ZetrixSDKExceptions.conflict();
                  break;
                case 408:
                  sdkExceptions = const ZetrixSDKExceptions.requestTimeout();
                  break;
                case 500:
                  sdkExceptions =
                      const ZetrixSDKExceptions.internalServerError();
                  break;
                case 503:
                  sdkExceptions =
                      const ZetrixSDKExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response!.statusCode;
                  sdkExceptions = ZetrixSDKExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioExceptionType.sendTimeout:
              sdkExceptions = const ZetrixSDKExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              sdkExceptions = const ZetrixSDKExceptions.badRequest();
            case DioExceptionType.badResponse:
              sdkExceptions = const ZetrixSDKExceptions.badRequest();
            case DioExceptionType.connectionError:
              sdkExceptions = const ZetrixSDKExceptions.badRequest();
          }
        } else if (error is SocketException) {
          sdkExceptions = const ZetrixSDKExceptions.noInternetConnection();
        } else {
          sdkExceptions = const ZetrixSDKExceptions.unexpectedError();
        }
        return sdkExceptions;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        if (kDebugMode) {
          print(e.toString());
        }
        return const ZetrixSDKExceptions.formatException();
      } catch (_) {
        return const ZetrixSDKExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const ZetrixSDKExceptions.unableToProcess();
      } else {
        return const ZetrixSDKExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(ZetrixSDKExceptions sdkExceptions) {
    var errorMessage = "";
    sdkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorisedRequest: () {
      errorMessage = "Unauthorised request";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}
