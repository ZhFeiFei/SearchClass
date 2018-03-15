package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.LoginBean;
import Bean.SCBean;
import Bean.StudentBean;
import DB.DBConn;

public class StudentDao {
    private Connection conn=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    public StudentDao(){
        conn=DBConn.getConnection();
    }
    //验证
    public Boolean isRegUser(LoginBean luser){
        boolean flag=false;
        String sql="select Sno,Spsw from students where Sno=? and Spsw=?";
        try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,luser.getSno());
            ps.setString(2, luser.getSpsw());
            rs=ps.executeQuery();
            if(rs.next()){
                flag=true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return flag;
    }
    //学号查询
    public StudentBean findByNum(String number){
        StudentBean user=null;
        String sql="select * from students where Sno=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,number);
            rs=ps.executeQuery();
            if(rs.next()){
                user=new StudentBean();
                user.setSid(rs.getInt("Sid"));
                user.setSname(rs.getString("Sname"));
                user.setSpsw(rs.getString("Spsw"));
                user.setSbirth(rs.getString("Sbirth"));
                user.setSsex(rs.getString("Ssex"));
                user.setSclass(rs.getString("Sclass"));
                user.setSdept(rs.getString("Sdept"));
                user.setSno(rs.getString("Sno"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }       
        return user;
    }

       //注册
      public boolean insertUser(StudentBean user){
      boolean flag=false;
      String sql="insert into students (Sno,Spsw,Sname,Sbirth,Sclass,Sdept,Ssex) values(?,?,?,?,?,?,?)";
      try {
        ps=conn.prepareStatement(sql);
          ps.setString(1,user.getSno());
          ps.setString(2,user.getSpsw());
          ps.setString(3,user.getSname());
          ps.setString(4,user.getSbirth());
          ps.setString(5,user.getSclass());
          ps.setString(6,user.getSdept());
          ps.setString(7,user.getSsex());
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
      public boolean delete(String number){
          boolean flag=false;
          String sql="delete from students where Sno=?";
          try {
            ps=conn.prepareStatement(sql);
            ps.setString(1,number);
            if(ps.executeUpdate()>0){
                flag=true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }return flag;
      }
     //更新
      public boolean update(StudentBean user){
         boolean flag=false;
            String sql = "update students set  Sname=?,Spsw=?,Sbirth=?,Sclass=?,Sdept=?,Ssex=? where Sno=?";
            try {
                ps=conn.prepareStatement(sql);
                ps.setString(1,user.getSname());
                ps.setString(2,user.getSpsw());
                ps.setString(3,user.getSbirth());
                ps.setString(4,user.getSclass());
                ps.setString(5,user.getSdept());
                ps.setString(6,user.getSsex());
                ps.setString(7,user.getSno());
                //ps.setInt(7,user.getSt_id());
                
                if(ps.executeUpdate()>0){
                    flag=true;
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }return flag;
    } 
     //查询全部
      public List<StudentBean> SelectAll(){
        List<StudentBean> userbeans = new ArrayList<StudentBean>();
            String sql="select * from students";
            try {
             ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                 while(rs.next())
                 {
                StudentBean user=new StudentBean();
                user.setSid(rs.getInt("Sid"));
                user.setSname(rs.getString("Sname"));
                user.setSpsw(rs.getString("Spsw"));
                user.setSno(rs.getString("Sno"));
                user.setSsex(rs.getString("Ssex"));
                user.setSclass(rs.getString("Sclass"));
                user.setSdept(rs.getString("Sdept"));
                user.setSbirth(rs.getString("Sbirth"));
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
          String sql="select count(*) from students";
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
      public List<StudentBean> findByPage(int Startindex, int pagenumper){
        List<StudentBean> list=new ArrayList<StudentBean>();
          String sql="select * from students limit ?,?";
          try {
            ps=conn.prepareStatement(sql);
            ps.setInt(1, Startindex);
            ps.setInt(2, pagenumper);
            rs=ps.executeQuery();
            while(rs.next()){
                StudentBean user=new StudentBean();
                user.setSid(rs.getInt("Sid"));
                user.setSname(rs.getString("Sname"));
                user.setSpsw(rs.getString("Spsw"));
                user.setSno(rs.getString("Sno"));
                user.setSbirth(rs.getString("Sbirth"));
                user.setSclass(rs.getString("Sclass"));
                user.setSdept(rs.getString("Sdept"));
                user.setSsex(rs.getString("Ssex"));
       
                list.add(user);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
          return list;
      }

public List<SCBean> findByPage2(String skey){
    List<SCBean> list=new ArrayList<SCBean>();
      String sql="select * from users where  Sno like %?% or Cno like %?% or Sname like %?%";
      try {
        ps=conn.prepareStatement(sql);
        ps.setString(1,skey);
        ps.setString(2,skey);
        ps.setString(3,skey);
        rs=ps.executeQuery();
        while(rs.next()){
            SCBean user=new SCBean();
            user.setSno(rs.getString("Sno"));
            user.setSname(rs.getString("Sname"));
            user.setCno(rs.getString("Cno"));
            user.setCname(rs.getString("Cname"));
            user.setGrade(rs.getString("Grade"));
            list.add(user);
        }
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
      return list;
  }
}

