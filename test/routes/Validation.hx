package routes;

import utest.Assert;
import thx.promise.Promise;

class Validation implements abe.IRoute {
  @:get("/validate/native/:id")
  @:validate({
    id : function(value : Int, req : Request, res : Response, next : Next) {
      if(value == 777)
        next()
      else
        res.sendStatus(400);
    }
  })
  function native(id : Int) {
    Assert.equals(777, id);
  }

  @:get("/validate/params/:name/:age")
  @:validate({
    age : _ >= 13 && _ < 200,
    name : _.toLowerString() == _
  })
  function withParams(name : String, age : Int) {
    Assert.is(name, String);
    Assert.is(age, Int);
    response.send({name:name,age:age});
  }

  @:get("/validate/async/:user")
  @:validate({
    user : Promise.delayed(_ == "theuser", 100)
  })
  function async(user : String) {
    Assert.equals("theuser", user);
  }
}
