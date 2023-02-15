enum OperationType {

  // Unknown operation
  UNKNOWN,

  // Activate an account
  ACCOUNT_ACTIVATE,

  // Set metadata
  ACCOUNT_SET_METADATA,

  // Set privilege
  ACCOUNT_SET_PRIVILEGE,

  // Issue token
  ASSET_ISSUE,

  // Send token
  ASSET_SEND,

  // Send gas
  GAS_SEND,

  // Issue token
  TOKEN_ISSUE,

  // Transfer token
  TOKEN_TRANSFER,

  // Transfer token from an account
  TOKEN_TRANSFER_FROM,

  // Approve token
  TOKEN_APPROVE,

  // Assign token
  TOKEN_ASSIGN,

  // Change owner of token
  TOKEN_CHANGE_OWNER,

  // Create contract
  CONTRACT_CREATE,

  // Invoke contract by sending token
  CONTRACT_INVOKE_BY_ASSET,

  // Invoke contract by sending gas
  CONTRACT_INVOKE_BY_GAS,

  // Create log
  LOG_CREATE
}
