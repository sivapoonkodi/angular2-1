import "package:angular2/src/core/change_detection/change_detection_util.dart";
import 'package:test/test.dart';

void main() {
  group("ChangeDetectionUtil", () {
    group("devModeEqual", () {
      test("should do the deep comparison of iterables", () {
        expect(
            devModeEqual([
              ["one"]
            ], [
              ["one"]
            ]),
            true);
        expect(devModeEqual(["one"], ["one", "two"]), false);
        expect(devModeEqual(["one", "two"], ["one"]), false);
        expect(devModeEqual(["one"], "one"), false);
        expect(devModeEqual(["one"], new Object()), false);
        expect(devModeEqual("one", ["one"]), false);
        expect(devModeEqual(new Object(), ["one"]), false);
      });
      test("should compare primitive numbers", () {
        expect(devModeEqual(1, 1), true);
        expect(devModeEqual(1, 2), false);
        expect(devModeEqual(new Object(), 2), false);
        expect(devModeEqual(1, new Object()), false);
      });
      test("should compare primitive strings", () {
        expect(devModeEqual("one", "one"), true);
        expect(devModeEqual("one", "two"), false);
        expect(devModeEqual(new Object(), "one"), false);
        expect(devModeEqual("one", new Object()), false);
      });
      test("should compare primitive booleans", () {
        expect(devModeEqual(true, true), true);
        expect(devModeEqual(true, false), false);
        expect(devModeEqual(new Object(), true), false);
        expect(devModeEqual(true, new Object()), false);
      });
      test("should compare null", () {
        expect(devModeEqual(null, null), true);
        expect(devModeEqual(null, 1), false);
        expect(devModeEqual(new Object(), null), false);
        expect(devModeEqual(null, new Object()), false);
      });
      test("should return true for other objects", () {
        expect(devModeEqual(new Object(), new Object()), true);
      });
    });
  });
}
