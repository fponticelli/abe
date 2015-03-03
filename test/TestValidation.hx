import utest.Assert;
import routes.*;
import js.node.http.Method;

class TestValidation extends TestCalls {
  public function testValidation() {
    router.register(new Validation());

  }
}
