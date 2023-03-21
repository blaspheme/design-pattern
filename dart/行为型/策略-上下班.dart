abstract class IStrategy {
  void execute();
}

class DriveStrategy extends IStrategy {
  @override
  void execute() {
    print("DriveStrategy");
  }
}

class WalkStrategy extends IStrategy {
  @override
  void execute() {
    print("WalkStrategy");
  }
}

class Context {
  late IStrategy strategy;

  Context(IStrategy this.strategy);

  void execute() {
    strategy.execute();
  }
}

void main(List<String> args) {
  Context context;
  context = new Context(new WalkStrategy());
  context.execute();
  context = new Context(new DriveStrategy());
  context.execute();
}
