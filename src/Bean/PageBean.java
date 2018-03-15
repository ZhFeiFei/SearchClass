package Bean;

import java.util.List;

import Bean.StudentBean;

public class PageBean {
    private int pagenumper;//每页数据量
    private int pagenum;//页号
    private int totalpagenum;//总页数
    private int totalcount;//总记录条数
    private List<StudentBean> user;//该页显示的数据
    public int getPagenumper() {
        return pagenumper;
    }
    public void setPagenumper(int pagenumper) {
        this.pagenumper = pagenumper;
    }
    public int getPagenum() {
        return pagenum;
    }
    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }
    public int getTotalpagenum() {
        return totalpagenum;
    }
    public void setTotalpagenum(int totalpagenum) {
        this.totalpagenum = totalpagenum;
    }
    public int getTotalcount() {
        return totalcount;
    }
    public void setTotalcount(int totalcount) {
        this.totalcount = totalcount;
    }
    public List<StudentBean> getUser() {
        return user;
    }
    public void setUser(List<StudentBean> user) {
        this.user = user;
    }
    
}
