import java.sql.ResultSet;
import java.sql.SQLException;

public class PrintResult {
    public static void printTableSales(ResultSet result) throws SQLException {
        System.out.println("id" + "\t" + "order_date" + "\t" + "count_product");
        System.out.println("-----------------------------");
        while (result.next()) {
            int id = result.getInt(1);
            String order_date = result.getString(2);
            String count_product = result.getString(3);
            System.out.println(id + "\t" + order_date + "\t" + count_product);
        }
    }
}