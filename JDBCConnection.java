ckage com.flyaway;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class Member {

	private String name ,email, password , pnumber;
	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Member(String name, String email, String password, String pnumber) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.pnumber = pnumber;
	}


	public String getPnumber() {
		return pnumber;
	}


	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
}


public class JDBCConnection {

	private String dburl = "jdbc:mysql://localhost:3307/flyaway";
	private String dbusername ="root";
	private String dbpassword ="Sahil1998#";
	private String dbdriver ="com.mysql.cj.jdbc.Driver";
	
	public Connection getConnection() 
	{
		loadDriver(dbdriver);
		Connection conn = null;
		try {
			 conn = DriverManager.getConnection(dburl, dbusername, dbpassword);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void loadDriver(String dbdriver)
	{
		try {
			Class.forName(dbdriver);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}
	
	
}	
