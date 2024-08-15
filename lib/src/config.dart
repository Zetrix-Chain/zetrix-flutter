abstract class ConfigReader {
  static String getBaseURL(bool mainnet) {
    return mainnet ? "https://node.zetrix.com" : "https://test-node.zetrix.com";
  }

  static String getCredentialURL(bool mainnet) {
    return mainnet
        ? "https://credential.zetrix.com"
        : "https://test-credential.zetrix.com";
  }
}
