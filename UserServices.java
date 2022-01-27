package com.flyaway;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserServices {
	
	JDBCConnection dbobj = new JDBCConnection();

	public  String insert(Member member)
	{
		String result = "Data Sucessfully Inserted";
		
	String sql = "insert into customers(FullName,Email,password,PhoneNumber) values(?,?,?,?)";
		
		try(Connection con = dbobj.getConnection();) {
			
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getEmail());
			ps.setString(3, member.getPassword());
			ps.setString(4, member.getPnumber()); 
			
			ps.executeUpdate();
			con.close();
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data Failed to Insert";
		}
				
		return result;
	}

	public boolean validateCustomer(String email,String Password) {
		boolean found = false;
		
		String sql = "select Email,password From customers where Email = '"+email+"' and password = '"+Password+"'";
		
		try(Connection con = dbobj.getConnection();)
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) 
			{
			System.out.println("Email:"+rs.getString("Email"));
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
	
	public void bookingOrderInsert( String userEmail, String travelingDate , String source, String departuretime, String destination,String arrivaltime,int flightno, String FlightCompany, int nooftravllers,int totalamount )
	{
		System.out.println("Booking insert Details");
		String sqlquery = "insert into bookingorders (UserEmail,TravleingDate,SourceLocation,DepartureTime,DestinationLocation,ArrivalTime,FlightNo, FlightCompany,NoOfTravellers,TotalAmount) values(?,?,?,?,?,?,?,?,?,?)";
		try(Connection con = dbobj.getConnection();) {
			
			
			PreparedStatement ps = con.prepareStatement(sqlquery);
			ps.setString(1, userEmail);
			ps.setString(2, travelingDate);
			ps.setString(3,source );
			ps.setString(4,departuretime ); 
			ps.setString(5,destination );
			ps.setString(6,arrivaltime );
			ps.setInt(7,flightno );
			ps.setString(8,FlightCompany );
			ps.setInt(9,nooftravllers ); 
			ps.setInt(10,totalamount); 
			
			ps.executeUpdate();
			con.close();
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		
	}

}