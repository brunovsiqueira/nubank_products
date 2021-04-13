// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future delay(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}

void main() {
  group('Nubank marketplace', () {

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await delay(2);
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('purchase offer shows dialog', () async {
      final portalGun = find.byValueKey("offer/portal-gun");
      await driver.waitFor(portalGun);
      await driver.tap(portalGun);
      final portalGunButton = find.byValueKey("offer/portal-gun-button");
      await driver.waitFor(portalGunButton);
      await driver.tap(portalGunButton);
      await delay(3);

      final dialog = find.byValueKey("offer/portal-gun-dialog");
      final close = find.byValueKey("offer/portal-gun-close");
      await driver.waitFor(close);
      driver.tap(close);
    });


  });
}