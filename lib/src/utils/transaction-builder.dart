import 'package:zetrix_flutter/src/models/operations/create-account-entity.dart';
import 'package:zetrix_flutter/src/models/operations/create-account.dart';
import 'package:zetrix_flutter/src/models/operations/priv.dart';
import 'package:zetrix_flutter/src/models/operations/thresholds.dart';
import 'package:zetrix_flutter/src/utils/tools.dart';

import '../models/base-operation.dart';
import 'operation-type.enum.dart';

class TransactionBuilder {
  static List<Object> build(
      List<BaseOperation> operationBase, String transSourceAddress) {
    List<Object> operations = [];

    for (int i = 0; i < operationBase.length; i++) {
      if (operationBase[i].operationType == null) {
        throw Exception("SDK Error");
      }

      OperationType operationType = operationBase[i].operationType!;

      switch (operationType) {
        case OperationType.ACCOUNT_ACTIVATE:
          //     operation = AccountServiceImpl.activate(
          //         (AccountActivateOperation) operationBase[i], transSourceAddress);
          CreateAccount createAccount = CreateAccount();
          createAccount.type = OperationType.ACCOUNT_ACTIVATE.index;
          CreateAccountEntity entity = CreateAccountEntity();
          Thresholds thresholds = Thresholds();
          thresholds.txThreshold = 1;
          Priv priv = Priv();
          priv.thresholds = thresholds;
          priv.masterWeight = 1;
          entity.priv = priv;
          entity.destAddress = operationBase[i].sourceAddress;
          createAccount.createAccount = entity;

          operations.add(createAccount);

          break;
        //   case OperationType.ACCOUNT_SET_METADATA:
        //     operation = AccountServiceImpl.setMetadata(
        //         (AccountSetMetadataOperation) operationBase[i]);
        //     break;
        //   case OperationType.ACCOUNT_SET_PRIVILEGE:
        //     operation = AccountServiceImpl.setPrivilege(
        //         (AccountSetPrivilegeOperation) operationBase[i]);
        //     break;
        //   case OperationType.ASSET_ISSUE:
        //     operation =
        //         AssetServiceImpl.issue((AssetIssueOperation) operationBase[i]);
        //     break;
        //   case OperationType.ASSET_SEND:
        //     operation = AssetServiceImpl.send(
        //         (AssetSendOperation) operationBase[i], transSourceAddress);
        //     break;
        //   case OperationType.GAS_SEND:
        //     operation = GasServiceImpl.send(
        //         (GasSendOperation) operationBase[i], transSourceAddress);
        //     break;
        //   case OperationType.CONTRACT_CREATE:
        //     operation = ContractServiceImpl.create(
        //         (ContractCreateOperation) operationBase[i]);
        //     break;
        //   case OperationType.CONTRACT_INVOKE_BY_ASSET:
        //     operation = ContractServiceImpl.invokeByAsset(
        //         (ContractInvokeByAssetOperation) operationBase[i],
        //         transSourceAddress);
        //     break;
        //   case OperationType.CONTRACT_INVOKE_BY_GAS:
        //     operation = ContractServiceImpl.invokeByGas(
        //         (ContractInvokeByGasOperation) operationBase[i],
        //         transSourceAddress);
        //     break;
        //   case OperationType.LOG_CREATE:
        //     operation =
        //         LogServiceImpl.create((LogCreateOperation) operationBase[i]);
        //     break;
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
