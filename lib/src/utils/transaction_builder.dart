import 'package:zetrix_flutter/src/models/chain/operation.dart';
import 'package:zetrix_flutter/src/models/common/priv.dart';
import 'package:zetrix_flutter/src/models/common/threshold.dart';
import 'package:zetrix_flutter/src/models/operations/account-activate-operation.dart';
import 'package:zetrix_flutter/src/models/operations/account-set-metadata-operation.dart';
import 'package:zetrix_flutter/src/models/operations/account-set-privilege-operation.dart';
import 'package:zetrix_flutter/src/models/operations/asset-send-operation.dart';
import 'package:zetrix_flutter/src/models/operations/base-operation.dart';
import 'package:zetrix_flutter/src/models/operations/contract-create-operation.dart';
import 'package:zetrix_flutter/src/models/operations/contract-invoke-by-asset-operation.dart';
import 'package:zetrix_flutter/src/models/operations/contract-invoke-by-gas-operation.dart';
import 'package:zetrix_flutter/src/models/operations/gas-send-operation.dart';
import 'package:zetrix_flutter/src/utils/tx-type.enum.dart';

import '../models/operations/asset-issue-operation.dart';
import '../models/operations/log-create-operation.dart';
import 'operation-type.enum.dart';

class TransactionBuilder {
  Operation activateAccount(
      AccountActivateOperation activateOp, String transSourceAddress) {
    if (activateOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (activateOp.destAddress == null) {
      throw Exception("Invalid destAddress");
    }

    if (activateOp.sourceAddress == activateOp.destAddress ||
        transSourceAddress == activateOp.destAddress) {
      throw Exception("sourceAddress equals to destAddress");
    }

    if (activateOp.initBalance == null ||
        int.parse(activateOp.initBalance!) < 0) {
      throw Exception("InitBalance must be between 0 and Long.MAX_VALUE");
    }

    ThresholdP threshold = ThresholdP();
    threshold.txThreshold = 1;
    Priv priv = Priv();
    priv.threshold = threshold;
    priv.masterWeight = 1;
    activateOp.priv = priv;

    Operation<AccountActivateOperation> op = Operation();
    op.createAccount = activateOp;
    op.type = TxType.CREATE_ACCOUNT.index;

    return op;
  }

  Operation setMetadata(AccountSetMetadataOperation setMetadataOp) {
    if (setMetadataOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (setMetadataOp.key == null || setMetadataOp.key!.length > 1024) {
      throw Exception("The length of key must be between 1 and 1024");
    }

    if (setMetadataOp.key == null || setMetadataOp.value!.length > 256000) {
      throw Exception("The length of value must be between 0 and 256000");
    }

    if (setMetadataOp.version == null || setMetadataOp.version! < 0) {
      throw Exception("The version must be equal to or greater than 0");
    }

    Operation<AccountSetMetadataOperation> op = Operation();
    op.setMetadata = setMetadataOp;
    op.type = TxType.SET_METADATA.index;

    return op;
  }

  Operation setPrivilege(AccountSetPrivilegeOperation privOp) {
    if (privOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (privOp.masterWeight == null || privOp.masterWeight! < 0) {
      throw Exception(
          "MasterWeight must be between 0 and (Integer.MAX_VALUE * 2L + 1)");
    }

    if (privOp.txThreshold == null || privOp.txThreshold! < 0) {
      throw Exception("TxThreshold must be between 0 and Long.MAX_VALUE");
    }

    Operation<AccountSetPrivilegeOperation> op = Operation();
    op.setPrivilege = privOp;
    op.type = TxType.SET_PRIVILEGE.index;

    return op;
  }

  Operation issueAsset(AssetIssueOperation issueOp) {
    if (issueOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (issueOp.code == null || issueOp.code!.length > 64) {
      throw Exception("The length of key must be between 1 and 64");
    }

    if (issueOp.amount == null || issueOp.amount! <= 0) {
      throw Exception(
          "Amount of the token to be issued must be between 1 and Long.MAX_VALUE");
    }

    Operation<AssetIssueOperation> op = Operation();
    op.issueAsset = issueOp;
    op.type = TxType.ISSUE_ASSET.index;

    return op;
  }

  Operation sendAsset(AssetSendOperation sendOp, transSourceAddress) {
    if (sendOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (sendOp.destAddress == null) {
      throw Exception("Invalid destAddress");
    }

    if (sendOp.sourceAddress == sendOp.destAddress ||
        transSourceAddress == sendOp.destAddress) {
      throw Exception("sourceAddress equals to destAddress");
    }

    if (sendOp.code == null || sendOp.code!.length > 64) {
      throw Exception("The length of key must be between 1 and 64");
    }

    if (sendOp.issuer == null) {
      throw Exception("Invalid issuer address");
    }

    if (sendOp.amount == null || sendOp.amount! < 0) {
      throw Exception("AssetAmount must be between 0 and Long.MAX_VALUE");
    }

    Operation<AssetSendOperation> op = Operation();
    op.payAsset = sendOp;
    op.type = TxType.PAY_ASSET.index;

    return op;
  }

  Operation sendGas(GasSendOperation sendOp, transSourceAddress) {
    if (sendOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (sendOp.destAddress == null) {
      throw Exception("Invalid destAddress");
    }

    if (sendOp.sourceAddress == sendOp.destAddress ||
        transSourceAddress == sendOp.destAddress) {
      throw Exception("sourceAddress equals to destAddress");
    }

    if (sendOp.amount == null || sendOp.amount! < 0) {
      throw Exception("ZtxAmount must be between 0 and Long.MAX_VALUE");
    }

    Operation<GasSendOperation> op = Operation();
    op.payCoin = sendOp;
    op.type = TxType.PAY_COIN.index;

    return op;
  }

  Operation contractCreate(ContractCreateOperation contractCreateOp) {
    if (contractCreateOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (contractCreateOp.initBalance == null ||
        int.parse(contractCreateOp.initBalance!) < 0) {
      throw Exception("InitBalance must be between 0 and Long.MAX_VALUE");
    }

    if (contractCreateOp.payload == null) {
      throw Exception("Payload cannot be empty");
    }

    Operation<ContractCreateOperation> op = Operation();
    op.createAccount = contractCreateOp;
    op.type = TxType.CREATE_ACCOUNT.index;

    return op;
  }

  Operation contractInvokeByGas(
      ContractInvokeByGasOperation contractInvokeOp, transSourceAddress) {
    if (contractInvokeOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (contractInvokeOp.contractAddress == null) {
      throw Exception("Invalid contract address");
    }

    if (contractInvokeOp.ztxAmount == null || contractInvokeOp.ztxAmount! < 0) {
      throw Exception("AssetAmount must be between 0 and Long.MAX_VALUE");
    }

    Operation<ContractInvokeByGasOperation> op = Operation();
    op.payCoin = contractInvokeOp;
    op.type = TxType.PAY_COIN.index;

    return op;
  }

  Operation contractInvokeByAsset(
      ContractInvokeByAssetOperation contractInvokeOp, transSourceAddress) {
    if (contractInvokeOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (contractInvokeOp.contractAddress == null) {
      throw Exception("Invalid contract address");
    }

    if (contractInvokeOp.code == null || contractInvokeOp.code!.length > 64) {
      throw Exception("The length of code must be between 1 and 64");
    }

    if (contractInvokeOp.issuer == null) {
      throw Exception("Invalid issuer address");
    }

    if (contractInvokeOp.assetAmount == null ||
        contractInvokeOp.assetAmount! < 0) {
      throw Exception("AssetAmount must be between 0 and Long.MAX_VALUE");
    }

    Operation<ContractInvokeByAssetOperation> op = Operation();
    op.payAsset = contractInvokeOp;
    op.type = TxType.PAY_ASSET.index;

    return op;
  }

  Operation createLog(LogCreateOperation createLogOp) {
    if (createLogOp.sourceAddress == null) {
      throw Exception("Invalid sourceAddress");
    }

    if (createLogOp.topic == null ||
        createLogOp.topic!.isEmpty ||
        createLogOp.topic!.length > 128) {
      throw Exception("The length of a log topic must be between 1 and 128");
    }

    if (createLogOp.datas == null || createLogOp.datas!.isEmpty) {
      throw Exception(
          "The length of one piece of log data must be between 1 and 1024");
    }

    Operation<LogCreateOperation> op = Operation();
    op.log = createLogOp;
    op.type = TxType.LOG.index;

    return op;
  }

  static List<Operation> build(
      List<BaseOperation> operationBase, String transSourceAddress) {
    TransactionBuilder instance = TransactionBuilder();

    List<Operation> operations = [];

    for (int i = 0; i < operationBase.length; i++) {
      if (operationBase[i].operationType == null) {
        throw Exception("SDK Error");
      }

      OperationType operationType = operationBase[i].operationType!;

      switch (operationType) {
        case OperationType.ACCOUNT_ACTIVATE:
          final op = instance.activateAccount(
              operationBase[i] as AccountActivateOperation, transSourceAddress);
          operations.add(op);
          break;
        case OperationType.ACCOUNT_SET_METADATA:
          final op = instance
              .setMetadata(operationBase[i] as AccountSetMetadataOperation);
          operations.add(op);
          break;
        case OperationType.ACCOUNT_SET_PRIVILEGE:
          final op = instance
              .setPrivilege(operationBase[i] as AccountSetPrivilegeOperation);
          operations.add(op);
          break;
        case OperationType.ASSET_ISSUE:
          final op =
              instance.issueAsset(operationBase[i] as AssetIssueOperation);
          operations.add(op);
          break;
        case OperationType.ASSET_SEND:
          final op = instance.sendAsset(
              operationBase[i] as AssetSendOperation, transSourceAddress);
          operations.add(op);
          break;
        case OperationType.GAS_SEND:
          final op = instance.sendGas(
              operationBase[i] as GasSendOperation, transSourceAddress);
          operations.add(op);
          break;
        case OperationType.CONTRACT_CREATE:
          final op = instance
              .contractCreate(operationBase[i] as ContractCreateOperation);
          operations.add(op);
          break;
        case OperationType.CONTRACT_INVOKE_BY_ASSET:
          final op = instance.contractInvokeByAsset(
              operationBase[i] as ContractInvokeByAssetOperation,
              transSourceAddress);
          operations.add(op);
          break;
        case OperationType.CONTRACT_INVOKE_BY_GAS:
          final op = instance.contractInvokeByGas(
              operationBase[i] as ContractInvokeByGasOperation,
              transSourceAddress);
          operations.add(op);
          break;
        case OperationType.LOG_CREATE:
          final op = instance.createLog(operationBase[i] as LogCreateOperation);
          operations.add(op);
          break;
        default:
          throw Exception("No operation");
      }
      // if (Tools.isEmpty(operation)) {
      //   throw new SDKException(SdkError.OPERATIONS_ONE_ERROR);
      // }
    }

    return operations;
  }
}
