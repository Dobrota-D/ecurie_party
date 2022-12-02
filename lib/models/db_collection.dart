import 'package:ecurie_party/models/event.dart';
import 'package:reflectable/reflectable.dart';

const collection = Serializable();

class Serializable extends Reflectable {
  const Serializable()
      : super(invokingCapability, typingCapability, reflectedTypeCapability, declarationsCapability, typeRelationsCapability);
}

class DbCollection {
  toJson(){
    InstanceMirror instanceMirror = collection.reflect(this);
    Map<String, dynamic> dataMapped = {};

    //classMirror.superclass.instanceMembers.forEach((key, value) => print(value.simpleName));

    var iterable = this is Event ? instanceMirror.type.superclass!.declarations.values : instanceMirror.type.declarations.values;
    // Mirror the instance's class (type) to get the declarations
    for (var declaration in iterable)
    {
      // If declaration is a type of variable, map variable name and value
      if (declaration is VariableMirror)
      {
        String variableName = declaration.simpleName;
        dynamic variableValue = instanceMirror.invokeGetter(declaration.simpleName);

        if ( variableName != "id" && variableValue != 0 ) dataMapped[variableName] = variableValue;
      }
    }
    return dataMapped;
  }
}