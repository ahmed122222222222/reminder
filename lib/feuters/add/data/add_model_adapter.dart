import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:hive/hive.dart';


class AddmodelAdapter extends TypeAdapter<Addmodel> {
  @override
  final int typeId = 1; // يجب تحديد رقم فريد لهذا النوع

  @override
  Addmodel read(BinaryReader reader) {
    return Addmodel(
      docname: reader.readString(),
      durgname: reader.readString(),
      hours: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Addmodel obj) {
    writer.writeString(obj.docname);
    writer.writeString(obj.durgname);
    writer.writeString(obj.hours);
  }
}
