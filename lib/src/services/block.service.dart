import 'package:flutter/foundation.dart';
import 'package:zetrix_flutter/src/services/base_node.service.dart';
import 'package:zetrix_flutter/src/utils/sdk-error.enum.dart';
import '../models/sdk-result.dart';
import '../models/network-exceptions.dart';
import '../models/block-number-resp.dart';

class ZetrixBlockService extends BaseNodeService {
  ZetrixBlockService(bool mainnet) : super(mainnet);

  Future<SDKResult<BlockNumberResp>> getBlockNumber() async {
    var url = '/getLedger';

    try {
      final response = await dio.get(url);
      BlockNumberResp blockNumberResp = BlockNumberResp.fromJson(response.data);

      if (blockNumberResp.errorCode == SdkError.success.code) {
        return SDKResult.success(data: blockNumberResp);
      } else {
        return SDKResult.failure(
            error: DefaultError(blockNumberResp.errorDesc ??
                SdkError.resultNotFound.toString()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return SDKResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
