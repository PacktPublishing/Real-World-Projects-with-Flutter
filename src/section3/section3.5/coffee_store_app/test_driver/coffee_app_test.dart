import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Drinks Test', () {

    FlutterDriver driver;

    final teaTypeFinder = find.byValueKey('Tea_drink_type');
    final blackTeaCardFinder = find.byValueKey('Black Tea_drink_type');
    final blackTeaOrderFinder = find.byValueKey('Black Tea_order');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null)
        driver.close();
    });

    test('find carousel tea card', () async{
      expect(await driver.getText(
        teaTypeFinder,
        timeout: Duration(
          seconds: 30,
        ),
      ), 'Tea');
    });

    test('find black tea', () async {
      await driver.tap(teaTypeFinder);
      expect(await driver.getText(
        blackTeaCardFinder,
      ), 'Black Tea');
    });

    test('find black tea order price', () async {
      await driver.tap(blackTeaCardFinder);
      expect(await driver.getText(
        blackTeaOrderFinder,
      ), 'Price: \$4.12');
    });

  });
}