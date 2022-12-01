import 'package:reflectable/reflectable.dart';

const collection = Serializable();

class Serializable extends Reflectable {
  const Serializable()
      : super(invokingCapability, typingCapability, reflectedTypeCapability);
}

class DbCollection {
  toJson(){
    InstanceMirror instanceMirror = collection.reflect(this);

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