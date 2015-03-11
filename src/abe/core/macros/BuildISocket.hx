package abe.core.macros;

import haxe.macro.Context;
import haxe.macro.Expr;
import abe.core.macros.Macros.*;

class BuildISocket {
  macro public static function complete() : Array<Field> {
    var fields = Context.getBuildFields();
    injectConstructor(fields);
    injectToString(fields);
    return fields;
  }

  static function injectConstructor(fields : Array<Field>) {
    if(hasField(fields, "new")) return;
    fields.push(createFunctionField("new"));
  }

  static function injectToString(fields : Array<Field>) {
    if(hasField(fields, "toString")) return;
    var cls = Context.getLocalClass().toString();
    fields.push(createFunctionField("toString", macro : String, macro return $v{cls}));
  }
}
