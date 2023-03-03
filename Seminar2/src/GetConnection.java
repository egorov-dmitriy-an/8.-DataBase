import java.sql.*;
import java.util.Properties;

public class GetConnection {
    public static Connection getConn() throws SQLException {
        //URL сервера базы данных MySQL
        String url = "jdbc:mysql://localhost:3306/seminar2home_java";

        //свойства для создания подключения к базе данных MySQL
        Properties props = new Properties();
        props.setProperty("user", "root");
        props.setProperty("password", "5150");

        //создание подключения к базе данных MySQL с помощью JDBC
        return DriverManager.getConnection(url, props);
    }
}