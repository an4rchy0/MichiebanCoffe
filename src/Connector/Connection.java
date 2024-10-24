package Connector;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection {
    private static java.sql.Connection connection = null;
    public static java.sql.Connection getConnection() {
        if (connection != null)
            return connection;
        else {
            String dbUrl = "jdbc:mysql://localhost:3306/michibancoffe?user=root&password=";
            try {
                Class.forName("com.mysql.jdbc.Driver");//panggil driver mysql
                connection = DriverManager.getConnection(dbUrl);//membuat sebuah koneksi
                System.out.println("Koneksi sukses");
            }catch(ClassNotFoundException | SQLException e) {
                System.out.println("Koneksi gagal : "+e);
            }
            return connection;
        }
    }
    public static void main(String[] args) {
        getConnection();
    }
}
