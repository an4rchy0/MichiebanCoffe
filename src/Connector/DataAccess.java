package Connector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
public class DataAccess {
    java.sql.Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public DataAccess(){
        conn = Connection.getConnection();
    }
    
    public void tampilData () {
        try {
            ps = conn.prepareStatement("select * from menu");
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.print(rs.getString(1)+ "    ");
                System.out.print(rs.getString(2)+ "    ");
                System.out.print(rs.getString(3)+ "    ");
                System.out.println(rs.getString(4));            
            }            
        }
        catch (SQLException se) {
            System.out.println("Salah : "+se);
        }
    } //console tampil data
    public DefaultTableModel getModelMenu() {
        DefaultTableModel model = new DefaultTableModel();
        Object[][] data;
        try {
           ps = conn.prepareStatement("Select * from menu");
           rs = ps.executeQuery();
           rs.last(); // ke record terakhir
           int jmlBaris = rs.getRow(); // menyimpan nomor record
           rs.beforeFirst();
           data = new Object[jmlBaris][4];
           int i = 0; // counter / pencacah
           while (rs.next()) {
               data[i][0] = rs.getString("ID");
               data[i][1] = rs.getString("Menu");
               data[i][2] = rs.getString("Price");
               i++;  
           }
           String[] namaCol = {"ID","Menu","Price"}; 
           model = new DefaultTableModel(data,namaCol);
        }
        catch(SQLException se) {
            System.out.println("Error : "+se );
        }
        return model;
    } //Model table Menu
    public DefaultTableModel getCustomer(){
         DefaultTableModel model = new DefaultTableModel();
        Object[][] data;
        try {
           ps = conn.prepareStatement("Select * from caffecustomer");
           rs = ps.executeQuery();
           rs.last(); // ke record terakhir
           int jmlBaris = rs.getRow(); // menyimpan nomor record
           rs.beforeFirst();
           data = new Object[jmlBaris][6];
           int i = 0; // counter / pencacah
           while (rs.next()) {
               data[i][0] = rs.getString("ID");
               data[i][1] = rs.getString("Username");
               data[i][2] = rs.getString("Menu");
               data[i][3] = rs.getString("QTY");
               data[i][4] = rs.getString("totalPrice");
               data[i][5] = rs.getString("user");
               i++;  
           }
           String[] namaCol = {"ID","Username","Menu","QTY", "Total","Servicer"}; 
           model = new DefaultTableModel(data,namaCol);
        }
        catch(SQLException se) {
            System.out.println("Error : "+se );
        }
        return model;
    }
    
    public void saveCustomer(String username, String menu, int qty, int total, int user){
        int opsi = JOptionPane.showConfirmDialog(null, "Benarkah anda ingin menyimpan data ini ?", 
                "Penyimpanan Data", JOptionPane.YES_NO_OPTION);
        if ((opsi == JOptionPane.YES_OPTION)){
            String sqlQuery;
            try {
                sqlQuery = "insert into caffecustomer (username, menu, qty, totalPrice, user) values (?,?,?,?,?)";
                ps = conn.prepareStatement(sqlQuery);
                ps.setString(1, username);
                ps.setString(2, menu);
                ps.setInt(3, qty); 
                ps.setInt(4, total);
                ps.setInt(5, user);
                ps.executeUpdate();
            }
            catch (SQLException se) {
                System.out.println("Error : "+se);
            }
        }
    }
    
    public String tampilProfit () {
        String profit;
        try {
            ps = conn.prepareStatement("SELECT SUM(totalPrice) FROM caffecustomer;");
            rs = ps.executeQuery();
            rs.next();
            profit = rs.getString(1);    
        }
        catch (SQLException se) {
            System.out.println("Salah : "+se);
            profit ="";
        }
        return profit;
    }
    
    public String tampilCountCus () {
        String cus;
        try {
            ps = conn.prepareStatement("SELECT COUNT(username) FROM caffecustomer;");
            rs = ps.executeQuery();
            rs.next();
            cus = rs.getString(1);    
        }
        catch (SQLException se) {
            System.out.println("Salah : "+se);
            cus = "";
        }
        return cus;
    }
    
    public String tampilUsr () {
        String usr;
        try {
            ps = conn.prepareStatement("SELECT COUNT(username) FROM caffeuser;");
            rs = ps.executeQuery();
            rs.next();
            usr = rs.getString(1);    
        }
        catch (SQLException se) {
            System.out.println("Salah : "+se);
            usr = "";
        }
        return usr;
    }
    
    public static void main(String[] args) {
        DataAccess da = new DataAccess();
        da.tampilData();
    }    
}
