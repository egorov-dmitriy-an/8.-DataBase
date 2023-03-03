public class Request {
    public String creatTableSales = "CREATE TABLE IF NOT EXISTS sales" +
            "(\n" +
            "\tid INT PRIMARY KEY AUTO_INCREMENT,\n" +
            " order_date DATE NOT NULL,\n" +
            " count_product INT\n" +
            ");";
    public String insertTableSales = "INSERT sales(order_date, count_product)\n" +
            "VALUES \n" +
            "\t(\"2022-01-01\", 156),\n" +
            "\t(\"2022-01-02\", 180),\n" +
            "\t(\"2022-01-03\", 21),\n" +
            "\t(\"2022-01-04\", 124),\n" +
            "\t(\"2022-01-05\", 341);";

    public String selectAll = "SELECT * FROM sales;";
    public String range = "SELECT id, order_date,\n" +
            "CASE\n" +
            "\tWHEN count_product < 100 THEN \"Small order\"\n" +
            "    WHEN count_product > 100 AND count_product < 300 THEN \"Average order\"\n" +
            "    ELSE \"Large order\"\n" +
            "END AS \"Order type\"\n" +
            "FROM sales;";
}