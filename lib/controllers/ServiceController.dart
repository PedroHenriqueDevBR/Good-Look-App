import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/Service.dart';
import '../models/Service.dart';

class ServiceController {
  Future<Database> getDatasabe() async {
    final pathDatabase = await getDatabasesPath();
    final localeDatabase = join(pathDatabase, "goodlook.db");

    Database db = await openDatabase(localeDatabase,
        version: 1, onCreate: (Database db, int version) async {});
    return db;
  }

  getAllServices(userId) async {
    Database db = await getDatasabe();
    String sql =
        "select s.* from service s inner join user u on s.user = u.id where u.id = $userId;";
    List<Map> services = await db.rawQuery(sql);

    db.close();
    return services;
  }

  getService(serviceId) async {
    Database db = await getDatasabe();
    String sql = 'select * from service where id = $serviceId;';
    List<Map> service = await db.rawQuery(sql);
    db.close();
    return service;
  }

  newService(Service service, int userId) async {
    Database db = await getDatasabe();
    String sql =
        "insert into service (name, description, total_cost, price, user) values ('${service.name}', '${service.description}', ${service.total_cost}, ${service.price}, $userId);";
    int id = await db.rawInsert(sql);
    db.close();

    if (id > 0) {
      return id;
    } else {
      return -1;
    }
  }

  updateService(Service service, int serviceId) async {
    Database db = await getDatasabe();
    String sql =
        "update service set name = '${service.name}', description = '${service.description}', total_cost = ${service.total_cost}, price = ${service.price} where id = $serviceId;";
    int response = await db.rawUpdate(sql);
    db.close();
    return response;
  }

  deleteService(serviceId) async {
    Database db = await getDatasabe();
    String sql = 'delete from service where id = $serviceId;';
    int response = await db.rawDelete(sql);
    db.close();
    return response;
  }
}
