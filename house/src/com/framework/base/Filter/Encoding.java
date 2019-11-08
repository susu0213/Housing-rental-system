package com.framework.base.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by Jaylan on 2017-3-9.
 */
@WebFilter(filterName = "Encoding")
public class Encoding implements Filter {
    String encoding=null;
    public void destroy() {
        encoding=null;
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if(encoding!=null){
            //设置request字符编码
            req.setCharacterEncoding(encoding);
            //设置response字符编码
            resp.setContentType("text/html;charset="+encoding);
        }
        //传递给下一个过滤器
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
//获取初始化参数
        encoding=config.getInitParameter("encoding");
    }

}
