import 'package:flutter_test/flutter_test.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

void main() {

  test('test gasToUGas', () async {
    String result = Utils.gasToUGas('123.12312312');
    expect(result, isNot(''));

    result = Utils.gasToUGas('0.12312312');
    expect(result, isNot(''));

    result = Utils.gasToUGas('123');
    expect(result, isNot(''));

    result = Utils.gasToUGas('123.123123123');
    expect(result, '');

    result = Utils.gasToUGas('-1');
    expect(result, '');

    result = Utils.gasToUGas('abc');
    expect(result, '');
  });

  test('test ugasToGas', () async {
    String result = Utils.ugasToGas('123.12312312');
    expect(result, '');

    result = Utils.ugasToGas('0.12312312');
    expect(result, '');

    result = Utils.ugasToGas('123');
    expect(result, isNot(''));

    result = Utils.ugasToGas('-1');
    expect(result, '');

    result = Utils.ugasToGas('abc');
    expect(result, '');
  });

  test('test unitWithDecimals', () async {
    String result = Utils.unitWithDecimals('1', '6');
    expect(result, '1000000');

    result = Utils.unitWithDecimals('0.12312312', '6');
    expect(result, '');

    result = Utils.unitWithDecimals('1', '0.6');
    expect(result, '');
  });

  test('test utfToHex', () async {
    String result = Utils.utfToHex('hello, world');
    expect(result, '68656c6c6f2c20776f726c64');

    result = Utils.utfToHex('');
    expect(result, '');
  });

  test('test hexToUtf', () async {
    String result = Utils.hexToUtf('68656c6c6f2c20776f726c64');
    expect(result, 'hello, world');

    result = Utils.hexToUtf('asdas');
    expect(result, '');

    result = Utils.hexToUtf('');
    expect(result, '');
  });
}
