import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/models/base-response.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/sdk-exceptions.dart';
import 'package:zetrix_flutter/src/models/block/block-number.dart';

class ZetrixBlockService extends BaseNodeService {
  ZetrixBlockService(super.mainnet);

  Future<ZetrixSDKResult<BlockNumber>> getBlockNumber() async {
    var url = '/getLedger';

    try {
      final response = await dio.get(url);
      BaseResponse<BlockNumber> resp = BaseResponse<BlockNumber>.fromJson(
          response.data,
          (json) => BlockNumber.fromJson(json as Map<String, dynamic>));

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
