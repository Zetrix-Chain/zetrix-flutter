import 'package:zetrix_flutter/zetrix_flutter.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

class ZetrixService {
  // Your service methods go here
  late final ZetrixAccountService accountService;
  late final ZetrixBlockService blockService;
  late final ZetrixTransactionService transactionService;
  late final ZetrixContractService contractService;

  ZetrixService() {
    accountService = ZetrixAccountService(false);
    blockService = ZetrixBlockService(false);
    transactionService = ZetrixTransactionService(false);
    contractService = ZetrixContractService(false);
  }

  Future<CreateAccount> createZtxAcc() async {
    // Simulate a network call
    ZetrixSDKResult<CreateAccount> result = await accountService
        .createAccount();
    return result.when(
      success: (data) => data!,
      failure: (error) {
        throw Exception('Failed to create account: ${error.toString()}');
      },
    );
  }

  Future<AccountInfo> getZtxAccInfo() async {
    // Simulate a network call
    ZetrixSDKResult<AccountInfo> result = await accountService.getAccountInfo(
      'ZTX3To7gigaCsNat9g6NCyzWqocyx1DkQhGvW',
    );
    return result.when(
      success: (data) => data!,
      failure: (error) {
        throw Exception('Failed to create account: ${error.toString()}');
      },
    );
  }

  Future<BlockNumber> getZtxBlockNumber() async {
    // Simulate a network call
    ZetrixSDKResult<BlockNumber> result = await blockService.getBlockNumber();
    return result.when(
      success: (data) => data!,
      failure: (error) {
        throw Exception('Failed to get block number: ${error.toString()}');
      },
    );
  }

  Future<TransactionBuildBlobResult> buildZtxBlob() async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = 'ZTX3VR7tymgxUrGKxL7E11a15CvbUhCiuvYmk';
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    AccountActivateOperation op = AccountActivateOperation();
    op.operationType = OperationType.ACCOUNT_ACTIVATE;
    op.sourceAddress = 'ZTX3VR7tymgxUrGKxL7E11a15CvbUhCiuvYmk';
    op.destAddress = 'ZTX3W6x7bDYzJagRGYLAH5enZjkRiP8r3ABaG';
    op.initBalance = '10';
    operations.add(op);
    req.operations = operations;

    ZetrixSDKResult<TransactionBuildBlobResult> result =
        await transactionService.buildBlob(req);
    return result.when(
      success: (data) => data!,
      failure: (error) {
        throw Exception(
          'Failed to build transaction blob: ${error.toString()}',
        );
      },
    );
  }

  Future<Object?> callZtxContract() async {
    ContractCallReq req = ContractCallReq();
    req.sourceAddress = "ZTX3XDeQk86zpZqM7k2xCBDD75oZ7gk3M3Gnc";
    req.contractAddress = "ZTX3LUP4Lwy3XLBcRhUSojXha1Zy3K1sXuCyY";
    req.optType = 2;
    req.feeLimit = 1000000;
    req.gasPrice = 10;
    req.input = '{"method": "getAllTasks", "params": {"status":"None"}}';
    ZetrixSDKResult<ContractCallResult> resp = await contractService.call(req);

    return resp.when(
      success: (data) => data?.queryRets?.first,
      failure: (error) {
        throw Exception('Failed to call contract: ${error.toString()}');
      },
    );
  }
}
