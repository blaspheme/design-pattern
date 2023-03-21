abstract class Handler {
  Handler? _next;

  void handleRequest(String value);

  Handler? next() {
    return this._next;
  }

  void setNext(Handler nextHandler) {
    this._next = nextHandler;
  }
}

// 具体村、镇、县处理者
class VillageHandler extends Handler {
  @override
  void handleRequest(String value) {
    if ("village" == value) {
      print("VillageHandler: handled~");
    } else {
      print("VillageHandler: pass~");
      this.next()?.handleRequest(value);
    }
  }
}

class TownHandler extends Handler {
  @override
  void handleRequest(String value) {
    if ("town" == value) {
      print("TownHandler: handled~");
    } else {
      print("TownHandler: pass~");
      this.next()?.handleRequest(value);
    }
  }
}

class CountyHandler extends Handler {
  @override
  void handleRequest(String value) {
    if ("county" == value) {
      print("County: handled~");
    } else if (this.next() == null) {
      print("no next Handler, this request can not be handle~");
    } else {
      print("County: pass~");
      this.next()?.handleRequest(value);
    }
  }
}

void main(List<String> args) {
  Handler villageHandler = new VillageHandler();
  Handler townHandler = new TownHandler();
  Handler countyHandler = new CountyHandler();

  villageHandler.setNext(townHandler);
  townHandler.setNext(countyHandler);

  print("test county request:");
  villageHandler.handleRequest("county");

  print("test city request:");
  villageHandler.handleRequest("city");
}
