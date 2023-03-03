import java.sql.*;
public class Program {

    public static void main(String[] args) throws SQLException {
        String request_sql;
        Request req = new Request();
        PreparedStatement preStat;

        //создание подключения к базе данных MySQL с помощью JDBC
        Connection connection = GetConnection.getConn();

        // 1. Создадим таблицу
        /*
        request_sql = req.creatTableSales;
        preStat = connection.prepareStatement(request_sql);
        preStat.executeUpdate();
        System.out.println("Table sales create");
        */

        //Заполним таблицу
        /*
        request_sql = req.insertTableSales;
        preStat = connection.prepareStatement(request_sql);
        preStat.executeUpdate();
        System.out.println("Table sales insert");
        */

        /* 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
        меньше 100  	-  Маленький заказ/Small order
        от 100 до 300   -  Средний заказ/Average order
        больше 300      -  Большой заказ/Large order
        Выполним запрос.
        */

        request_sql = req.range;
        preStat = connection.prepareStatement(request_sql);
        ResultSet result = preStat.executeQuery();
        System.out.println("Result for request:");
        PrintResult.printTableSales(result);
    }
}