/// A minimal serialization library, just intended to give an
/// example of how package:reflectable can be used
/// Doesn't check for cycles in the serialized data, and is not customizable
/// at all.
/// Only serializes public fields.
library test_reflectable.serialize;

import 'package:ecurie_party/models/log.dart';
import 'package:reflectable/reflectable.dart';

const reflector = const Serializable();

class Serializable extends Reflectable {
  const Serializable()
      : super(invokingCapability, typingCapability, reflectedTypeCapability);
}

class DbCollection {
  toJson(){
    InstanceMirror instanceMirror = reflector.reflect(this);

    Map<String, dynamic> dataMapped = Map();

    // Mirror the instance's class (type) to get the declarations
    for (var declaration in instanceMirror.type.declarations.values)
    {
      // If declaration is a type of variable, map variable name and value
      if (declaration is VariableMirror)
      {
        String variableName = declaration.simpleName;
        dynamic variableValue = instanceMirror.invokeGetter(declaration.simpleName);

        dataMapped[variableName] = variableValue;
      }
    }
    return dataMapped;
  }
}