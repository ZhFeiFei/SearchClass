package Bean;

import java.util.List;

import Bean.CourseBean;

public class CoursePageBean {
    private int pagenumper;//ÿҳ������
    private int pagenum;//ҳ��
    private int totalpagenum;//��ҳ��
    private int totalcount;//�ܼ�¼����
    private List<CourseBean> user;//��ҳ��ʾ������
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
    public List<CourseBean> getUser() {
        return user;
    }
    public void setUser(List<CourseBean> user) {
        this.user = user;
    }
    
}
