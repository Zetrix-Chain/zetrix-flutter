import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';
import 'package:zetrix_flutter/src/models/contract/contract-call-req.dart';
import 'package:zetrix_flutter/src/models/contract/contract-call-result.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';

import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/sdk-exceptions.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';

class ZetrixContractService extends BaseNodeService {
  ZetrixContractService(super.mainnet);

  Future<ZetrixSDKResult<ContractCallResult>> call(ContractCallReq req) async {
    String url = '/callContract';

    if (req.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    // if (req.contractAddress == null) {
    //   throw Exception("Invalid contractAddress");
    // }

    if (req.sourceAddress == req.contractAddress) {
      throw Exception("sourceAddress equals to contractAddress");
    }

    if (req.contractAddress == null && req.code == null) {
      throw Exception(
          "ContractAddress and code cannot be empty at the same time");
    }

    if (req.feeLimit! < 0) {
      throw Exception("FeeLimit must be between 0 and Long.MAX_VALUE");
    }

    if (req.optType! < 0 || req.optType! > 2) {
      throw Exception("OptType must be between 0 and 2");
    }

    try {
      final response = await dio.post(url, data: req.toJson());

      BaseResponse<ContractCallResult> resp =
          BaseResponse<ContractCallResult>.fromJson(
        response.data,
        (json) => ContractCallResult.fromJson(json as Map<String, dynamic>),
      );

      if (resp.errorCode == SdkError.success.code) {
        return ZetrixSDKResult.success(data: resp.result);
      } else {
        return ZetrixSDKResult.failure(
            error: DefaultError(
                resp.errorDesc ?? SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return ZetrixSDKResult.failure(
          error: ZetrixSDKExceptions.getDioException(e));
    }
  }
}
