import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/src/models/common/signer.dart';
import 'package:zetrix_flutter/src/models/operations/account-activate-operation.dart';
import 'package:zetrix_flutter/src/models/operations/account-set-metadata-operation.dart';
import 'package:zetrix_flutter/src/models/operations/account-set-privilege-operation.dart';
import 'package:zetrix_flutter/src/models/operations/asset-issue-operation.dart';
import 'package:zetrix_flutter/src/models/operations/asset-send-operation.dart';
import 'package:zetrix_flutter/src/models/operations/contract-create-operation.dart';
import 'package:zetrix_flutter/src/models/operations/contract-invoke-by-asset-operation.dart';
import 'package:zetrix_flutter/src/models/operations/contract-invoke-by-gas-operation.dart';
import 'package:zetrix_flutter/src/models/operations/gas-send-operation.dart';
import 'package:zetrix_flutter/src/models/sdk-result.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/models/network-exceptions.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-build-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-build-blob-resp.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-info-resp.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-sign-req.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-sign-resp.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-sign-result.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-req.dart';
import 'package:zetrix_flutter/src/models/transaction/transaction-submit-blob-result.dart';
import 'package:zetrix_flutter/src/services/transaction.service.dart';
import 'package:zetrix_flutter/src/utils/operation-type.enum.dart';

void main() {
  final service = ZetrixTransactionService(false);

  String privKey = "";
  String zetrixAddr = "";

  test('creating blob for account creation', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    AccountActivateOperation op = AccountActivateOperation();
    op.operationType = OperationType.ACCOUNT_ACTIVATE;
    op.sourceAddress = zetrixAddr;
    op.destAddress = 'ZTX3W6x7bDYzJagRGYLAH5enZjkRiP8r3ABaG';
    op.initBalance = '10';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for set metadata', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    AccountSetMetadataOperation op = AccountSetMetadataOperation();
    op.operationType = OperationType.ACCOUNT_SET_METADATA;
    op.sourceAddress = req.sourceAddress;
    op.key = 'test1';
    op.value = '10';
    op.version = 2;
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for set privilege', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    Signer s1 = Signer();
    s1.address = "ZTX3XDeQk86zpZqM7k2xCBDD75oZ7gk3M3Gnc";
    s1.weight = 10;

    Signer s2 = Signer();
    s2.address = "ZTX3WqtkerJmcdHQLNvVdL91aKmLKzjARViJi";
    s2.weight = 10;

    List<BaseOperation> operations = [];
    AccountSetPrivilegeOperation op = AccountSetPrivilegeOperation();
    op.operationType = OperationType.ACCOUNT_SET_PRIVILEGE;
    op.sourceAddress = req.sourceAddress;
    op.masterWeight = 20;
    op.signers = [s1, s2];
    op.txThreshold = 20;
    op.typeThresholds = [];
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for issuing asset', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    AssetIssueOperation op = AssetIssueOperation();
    op.operationType = OperationType.ASSET_ISSUE;
    op.sourceAddress = req.sourceAddress;
    op.code = 'MYR';
    op.amount = 10;
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for pay asset', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    AssetSendOperation op = AssetSendOperation();
    op.operationType = OperationType.ASSET_SEND;
    op.sourceAddress = req.sourceAddress;
    op.destAddress = "ZTX3WqtkerJmcdHQLNvVdL91aKmLKzjARViJi";
    op.issuer = op.sourceAddress;
    op.code = 'MYR';
    op.amount = 10;
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for pay coin', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    GasSendOperation op = GasSendOperation();
    op.operationType = OperationType.GAS_SEND;
    op.sourceAddress = req.sourceAddress;
    op.destAddress = "ZTX3WqtkerJmcdHQLNvVdL91aKmLKzjARViJi";
    op.amount = 10;
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for create contract', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    ContractCreateOperation op = ContractCreateOperation();
    op.operationType = OperationType.CONTRACT_CREATE;
    op.sourceAddress = req.sourceAddress;
    op.payload = "xxxxx";
    op.initBalance = '0';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for create contract', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    ContractCreateOperation op = ContractCreateOperation();
    op.operationType = OperationType.CONTRACT_CREATE;
    op.sourceAddress = req.sourceAddress;
    op.payload = "xxxxx";
    op.initBalance = '0';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for invoke contract by gas', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    ContractInvokeByGasOperation op = ContractInvokeByGasOperation();
    op.operationType = OperationType.CONTRACT_INVOKE_BY_GAS;
    op.sourceAddress = req.sourceAddress;
    op.ztxAmount = 100;
    op.contractAddress = "ZTX3KYJ7V3xyqox7yXAXxoiZ5DE8QdV6hXE1W";
    op.input = '{"method": "test", "params": {"ab": 1}}';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('creating blob for invoke contract by asset', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    req.sourceAddress = zetrixAddr;
    req.nonce = 440;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    ContractInvokeByAssetOperation op = ContractInvokeByAssetOperation();
    op.operationType = OperationType.CONTRACT_INVOKE_BY_ASSET;
    op.sourceAddress = req.sourceAddress;
    op.assetAmount = 100;
    op.code = "MYR";
    op.issuer = op.sourceAddress;
    op.contractAddress = "ZTX3KYJ7V3xyqox7yXAXxoiZ5DE8QdV6hXE1W";
    op.input = '{"method": "test", "params": {"ab": 1}}';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;
    resp.when(success: (TransactionBuildBlobResp? obj) {
      blobResp = obj;
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });

    expect(blobResp, isNotNull);
  });

  test('create blob, sign and submit for account creation', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    TransactionSubmitBlobResult? submitResp;

    req.sourceAddress = zetrixAddr;
    req.nonce = 2020;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    AccountActivateOperation op = AccountActivateOperation();
    op.operationType = OperationType.ACCOUNT_ACTIVATE;
    op.sourceAddress = req.sourceAddress;
    op.destAddress = 'ZTX3WYnW6rJPMZ3dg6Brhcikd73dy7eMccFPY';
    op.initBalance = '10';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;

    await resp.when(success: (TransactionBuildBlobResp? obj) async {
      blobResp = obj;

      TransactionSignReq signReq = TransactionSignReq();
      signReq.blob = blobResp!.result!.transactionBlob;
      signReq.privateKeys = [privKey];

      SDKResult<TransactionSignResult> respSign = await service.sign(signReq);
      TransactionSignResult? signResp;
      await respSign.when(success: (TransactionSignResult? obj) async {
        signResp = obj;

        TransactionSubmitBlobReq submitReq = TransactionSubmitBlobReq();
        submitReq.signatures = signResp!.signatures!;
        submitReq.transactionBlob = signReq.blob;

        SDKResult<TransactionSubmitBlobResult> respSubmit =
            await service.submit(submitReq);
        await respSubmit.when(
            success: (TransactionSubmitBlobResult? obj) async {
          print(obj!.toJson().toString());
          submitResp = obj;
          expect(submitResp, isNotNull);
        }, failure: (NetworkExceptions? error) {
          submitResp = null;
        });
      }, failure: (NetworkExceptions? error) {
        signResp = null;
      });
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });
  }, skip: true);

  test('create blob, sign and submit for pay coin creation', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    TransactionSubmitBlobResult? submitResp;

    req.sourceAddress = zetrixAddr;
    req.nonce = 2022;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    GasSendOperation op = GasSendOperation();
    op.operationType = OperationType.GAS_SEND;
    op.sourceAddress = req.sourceAddress;
    op.destAddress = "ZTX3WYnW6rJPMZ3dg6Brhcikd73dy7eMccFPY";
    op.amount = 10;
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;

    await resp.when(success: (TransactionBuildBlobResp? obj) async {
      blobResp = obj;

      TransactionSignReq signReq = TransactionSignReq();
      signReq.blob = blobResp!.result!.transactionBlob;
      signReq.privateKeys = [privKey];

      SDKResult<TransactionSignResult> respSign = await service.sign(signReq);
      TransactionSignResult? signResp;
      await respSign.when(success: (TransactionSignResult? obj) async {
        signResp = obj;

        TransactionSubmitBlobReq submitReq = TransactionSubmitBlobReq();
        submitReq.signatures = signResp!.signatures!;
        submitReq.transactionBlob = signReq.blob;

        SDKResult<TransactionSubmitBlobResult> respSubmit =
            await service.submit(submitReq);
        await respSubmit.when(
            success: (TransactionSubmitBlobResult? obj) async {
          print(obj!.toJson().toString());
          submitResp = obj;
          expect(submitResp, isNotNull);
        }, failure: (NetworkExceptions? error) {
          submitResp = null;
        });
      }, failure: (NetworkExceptions? error) {
        signResp = null;
      });
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });
  }, skip: true);

  test('create blob, sign and submit for invoke contract', () async {
    TransactionBuildBlobReq req = TransactionBuildBlobReq();
    TransactionSubmitBlobResult? submitResp;

    req.sourceAddress = zetrixAddr;
    req.nonce = 2023;
    req.feeLimit = 35892000;
    req.gasPrice = 10;
    req.metadata = "";

    List<BaseOperation> operations = [];
    ContractInvokeByGasOperation op = ContractInvokeByGasOperation();
    op.operationType = OperationType.CONTRACT_INVOKE_BY_GAS;
    op.sourceAddress = req.sourceAddress;
    op.ztxAmount = 0;
    op.contractAddress = "ZTX3aymXGbrB7DtiDGkdivkS1Q3rYkcC9kucv";
    op.input =
        '{"method": "transfer", "params": {"to": "ZTX3WYnW6rJPMZ3dg6Brhcikd73dy7eMccFPY", "value": "1000"}}';
    operations.add(op);
    req.operations = operations;

    SDKResult<TransactionBuildBlobResp> resp = await service.buildBlob(req);
    TransactionBuildBlobResp? blobResp;

    await resp.when(success: (TransactionBuildBlobResp? obj) async {
      blobResp = obj;

      TransactionSignReq signReq = TransactionSignReq();
      signReq.blob = blobResp!.result!.transactionBlob;
      signReq.privateKeys = [privKey];

      SDKResult<TransactionSignResult> respSign = await service.sign(signReq);
      TransactionSignResult? signResp;
      await respSign.when(success: (TransactionSignResult? obj) async {
        signResp = obj;

        TransactionSubmitBlobReq submitReq = TransactionSubmitBlobReq();
        submitReq.signatures = signResp!.signatures!;
        submitReq.transactionBlob = signReq.blob;

        SDKResult<TransactionSubmitBlobResult> respSubmit =
            await service.submit(submitReq);
        await respSubmit.when(
            success: (TransactionSubmitBlobResult? obj) async {
          print(obj!.toJson().toString());
          submitResp = obj;
          expect(submitResp, isNotNull);
        }, failure: (NetworkExceptions? error) {
          submitResp = null;
        });
      }, failure: (NetworkExceptions? error) {
        signResp = null;
      });
    }, failure: (NetworkExceptions? error) {
      blobResp = null;
    });
  });

  test('get tx history', () async {
    String hash =
        '33e3df28879dae5a8d9c6c4b0317a96005d458d503a1c72a2297af8cf53ca55b';

    SDKResult<TransactionInfoResp> resp = await service.getInfo(hash);
    TransactionInfoResp? infoResp;
    resp.when(success: (obj) {
      infoResp = obj;
    }, failure: (NetworkExceptions? error) {
      infoResp = null;
    });

    expect(infoResp, isNotNull);
  });
}
