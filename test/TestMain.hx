import haxe.unit.TestRunner;
class TestMain {

    static function main() {
        var times:Int = 1; 
        if(Sys.args().length > 0)
          times = Std.parseInt(Sys.args()[0]);
        var runner:TestRunner = new TestRunner();
        runner.add(new TestPool());
        for (i in 0...times) {
          if(!runner.run()) {
            if(times > 1)
              Sys.println('FAILURE: ${i+1}/$times');
            Sys.exit(1);
          }
        }
        if(times > 1)
          Sys.println('SUCCESS: $times/$times');
        Sys.exit(0);
        
    }

}