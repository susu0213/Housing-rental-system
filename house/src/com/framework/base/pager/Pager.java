package com.framework.base.pager;

import java.util.List;

/**
 * Created by Jaylan on 2017-3-6.
 */
public class Pager {

    private int pageNow = 1;
    private int pageSize = 10;
    private int totalCount;
    private int totalPages;
    private int offSet;
    private List<?> datas;
    private String admin;

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.totalPages = (this.totalCount%pageSize==0)?this.totalCount/this.pageSize:(this.totalCount/this.pageSize)+1;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getOffSet() {
        this.offSet = (this.pageNow-1)*10;
        return offSet;
    }

    public void setOffSet(int offSet) {
        this.offSet = offSet;
    }

    public List<?> getDatas() {
        return datas;
    }

    public void setDatas(List<?> datas) {
        this.datas = datas;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }
}
