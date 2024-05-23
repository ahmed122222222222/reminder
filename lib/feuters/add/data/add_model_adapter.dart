import 'package:hive/hive.dart';
import 'package:ah/feuters/add/data/modeladdd.dart';

class AddmodelAdapter extends TypeAdapter<Addmodel> {
  @override
  final int typeId = 1;

  @override
  Addmodel read(BinaryReader reader) {
    return Addmodel(
      docname: reader.readString(),
      durgname: reader.readString(),
      hours: reader.readString(),
      id: reader.readInt(),
      numberOfAlarms: reader.readInt(), // Read the new field
    );
  }

  @override
  void write(BinaryWriter writer, Addmodel obj) {
    writer.writeString(obj.docname);
    writer.writeString(obj.durgname);
    writer.writeString(obj.hours);
    writer.writeInt(obj.id);
    writer.writeInt(obj.numberOfAlarms); // Write the new field
  }
}
