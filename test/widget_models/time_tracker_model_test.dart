import 'package:brana/ui/widgets/common/time_tracker/time_tracker_model.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TimeTrackerModel -', () {
    test('stream emits correct duration values', () {
      final startTime = DateTime.now();
      final model = TimeTrackerModel(startTime);

      fakeAsync((async) {
        // Skip forward in time
        async.elapse(const Duration(seconds: 3));

        expect(
            model.stream,
            emitsInOrder([
              const Duration(seconds: 1),
              const Duration(seconds: 2),
              const Duration(seconds: 3),
            ]));
      });
    });

    test('formattedTime returns correctly formatted time', () {
      final startTime = DateTime.now().subtract(const Duration(seconds: 3661));
      final model = TimeTrackerModel(startTime);

      fakeAsync((async) {
        async.elapse(const Duration(seconds: 1));
        expect(model.formattedTime, '1:01:01');
      });
    });
  });
}
