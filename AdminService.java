package com.flyaway;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AdminService {
	
	JDBCConnection dbobj = new JDBCConnection();
	
	public boolean validateEmployee(String username,String password) {
		boolean found = false;
		
		String sql = "select UserName,Password From admin where UserName = '"+username+"' and Password = '"+password+"'";
		
		try(Connection con = dbobj.getConnection();)
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) 
			{
			System.out.println("UserName:"+rs.getString("UserName"));
			found = true;
			
			}
			con.close();
				
		}
	    catch(SQLException e)
		{
			e.printStackTrace();
		
		}
		
		return found;
	}

	
	public void employeeRegistarion(String FullName,String Email,String PhoneNumber,String UserName)
	{
		
	System.out.println("Employee insertion details");
	String sql = "insert into Employee(FullName,Email,PhoneNumber,UserName) values(?,?,?,?)";
		
		try(Connection con = dbobj.getConnection();) {
			
			System.out.println(UserName);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, FullName);
			ps.setString(2, Email);
			ps.setString(3, PhoneNumber);
			ps.setString(4, UserName); 
			
			ps.executeUpdate();
	//		String sqlquery = "update employee set UserName = '"+UserName +"'where email='"+Email+"'";
	//		Statement stmt = con.createStatement();
	//		ResultSet rs = stmt.executeQuery(sqlquery);
			con.close();
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
			
	}
	

	
	public void routeRegister(int routeid, String sourcelocation, String destinationlocation )
	{
		
	String sql = "insert into routes(Route_ID,SourceLocation,DestinationLocation) values(?,?,?)";
		
		try(Connection con = dbobj.getConnection();) {
			
			System.out.println("routeTable");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, routeid);
			ps.setString(2, sourcelocation);
			ps.setString(3, destinationlocation);
			
			ps.executeUpdate();
			con.close();
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
	
	
	public void flightRegister(int flightno,String flightcompany,int price,String travelingdate,int noofseats,String departuretime,String arrivaltime,int routeid)
	{
		String sql = "insert into flights(FlightNo,FlightCompany,price,TravellingDate,AvailableSeats,DepartureTime, ArrivalTime,Route_ID ) values(?,?,?,?,?,?,?,?)";
		
		try(Connection con = dbobj.getConnection();) {
			
			System.out.println("FlightTable");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, flightno);
			ps.setString(2, flightcompany);
			ps.setInt(3, price);
			ps.setString(4, travelingdate);
			ps.setInt(5,noofseats );
			ps.setString(6, departuretime);
			ps.setString(7, arrivaltime);
			ps.setInt(8, routeid);
			
			ps.executeUpdate();
			con.close();
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
	
	
	
	

}