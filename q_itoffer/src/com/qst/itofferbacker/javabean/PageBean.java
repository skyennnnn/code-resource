package com.qst.itofferbacker.javabean;

import java.util.ArrayList;
import java.util.List;
/**
 * 用户列表分页JavaBean
 * @公司 青软实训
 * @作者 fengjj
 */
public class PageBean<T> {
    // 每页显示记录数
    private int pageSize = 10;
    // 当前页码
    private int pageNo = 1;
    // 总页数
    private int totalPages;
    // 总记录数
    private int recordCount;
    // 每页数据记录集合
    private List<T> pageData = new ArrayList<T>();
    // 是否有下一页
    private boolean hasNextPage;
    // 是否有上一页
    private boolean hasPreviousPage;

    public PageBean() {
    }
    public PageBean(int pageSize, int pageNo) {
        this.pageSize = pageSize;
        this.pageNo = pageNo;
    }
    public int getTotalPages() {
        return (recordCount + pageSize - 1) / pageSize;
    }
    public List<T> getPageData() {
        return pageData;
    }
    public void setPageData(List<T> pageData) {
        this.pageData = pageData;
    }
    public boolean isHasNextPage() {
        return (this.getPageNo() < this.getTotalPages());
    }
    public void setHasNextPage(boolean hasNextPage) {
        this.hasNextPage = hasNextPage;
    }
    public boolean isHasPreviousPage() {
        return (this.getPageNo() > 1);
    }

    private int getPageNo() {
        return pageNo;
    }

    public void setHasPreviousPage(boolean hasPreviousPage) {
        this.hasPreviousPage = hasPreviousPage;
    }

    public void setPageNo(int pageNo) {
        this.pageNo=pageNo;
    }

    public int getRecordCount() {
        return recordCount;
    }
    public void setRecordCount(int recordCount) {
        this.recordCount = recordCount;
    }
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
    //......省略其它属性的setter和getter方法
}
