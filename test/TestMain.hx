import haxe.unit.TestRunner;
class TestMain {

    static function main() {
        var runner:TestRunner = new TestRunner();
        runner.add(new TestPool());
        runner.run();
    }

}