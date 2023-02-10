import 'package:isar/isar.dart';

part 'detail.g.dart';

@embedded
class DetailCollection {
  int? createAtEpoch;
  int? updatedAtEpoch;
  bool? isUploaded;

  DetailCollection({
    this.createAtEpoch,
    this.updatedAtEpoch,
    this.isUploaded,
  });
}
