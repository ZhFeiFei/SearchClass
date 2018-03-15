package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.CourseBean;
import DB.DBConn;

public class CourseDao {
    private Connection conn=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    public CourseDao(){
        conn=DBConn.getConnection();
    }
    //验证

    //学号查询
    public CourseBean findByNum(int Cno){
    	CourseBean user=null;
        String sql="select * from course where Cno=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1,Cno);
            rs=ps.executeQuery();
            if(rs.next()){
                user=new CourseBean();
                user.setCno(rs.getInt("Cno"));
                user.setCname(rs.getString("Cname"));
                user.setTno(rs.getInt("Tno"));
                user.setTname(rs.getString("Tname"));
                user.setCcredit(rs.getInt("Ccredit"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }       
        return user;
    }

       //注册
      public boolean insertUser(CourseBean user){
      boolean flag=false;
      String sql="insert into course (Cno,Cname,Tno,Tname,Ccredit) values(?,?,?,?,?)";
      try {
        ps=conn.prepareStatement(sql);
          ps.setInt(1,user.getCno());
          ps.setString(2,user.getCname());
          ps.setInt(3,user.getTno());
          ps.setString(4,user.getTname());
          ps.setInt(5,user.getCcredit());
          if(ps.executeUpdate()>0){
              flag=true;
          }
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
      return flag;
     }
      //删除
      public boolean delete(int Cno){
          boolean flag=false;
          String sql="delete from course where Cno = ?";
          try {
            ps=conn.prepareStatement(sql);
            ps.setInt(1,Cno);
            if(ps.executeUpdate()>0){
                flag=true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }return flag;
      }
     //更新
      public boolean update(CourseBean user){
         boolean flag=false;
            String sql = "update course set  Cno=?,Cname=?,Tno=?,Tname=?,Ccredit=? where Cno = ?";
            try {
                ps=conn.prepareStatement(sql);
                ps.setInt(1,user.getCno());
                ps.setString(2,user.getCname());
                ps.setInt(3,user.getTno());
                ps.setString(4,user.getTname());
                ps.setInt(5,user.getCcredit());
                ps.setInt(6, user.getCno());
                if(ps.executeUpdate()>0){
                    flag=true;
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }return flag;
    } 
     //查询全部
      public List<CourseBean> SelectAll(){
        List<CourseBean> userbeans = new ArrayList<CourseBean>();
            String sql="select * from course";
            try {
             ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                 while(rs.next())
                 {
                CourseBean user=new CourseBean();
                user.setCno(rs.getInt("Cno"));
                user.setCname(rs.getString("Cname"));
                user.setTno(rs.getInt("Tno"));
                user.setTname(rs.getString("Tname"));
                user.setCcredit(rs.getInt("Ccredit"));
                userbeans.add(user);
            }
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
          return userbeans;
     }
     //查询数据条数
      public int getTotalCount(){
          int totalcount=0;
          String sql="select count(*) from course";
          try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next())
            {
                totalcount=rs.getInt(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
          return totalcount;
      }
     //每页显示数据
      public List<CourseBean> findByPage(int Startindex, int pagenumper){
        List<CourseBean> list=new ArrayList<CourseBean>();
          String sql="select * from course limit ?,?";
          try {
            ps=conn.prepareStatement(sql);
            ps.setInt(1, Startindex);
            ps.setInt(2, pagenumper);
            rs=ps.executeQuery();
            while(rs.next()){
            	CourseBean user=new CourseBean();
                user.setCno(rs.getInt("Cno"));
                user.setCname(rs.getString("Cname"));
                user.setTno(rs.getInt("Tno"));
                user.setTname(rs.getString("Tname"));
                user.setCcredit(rs.getInt("Ccredit"));
                list.add(user);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
          return list;
      }
}
