package ebook.filter;

import javax.servlet.annotation.WebFilter;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;

import ebook.utils.UrlConst;


@WebFilter(displayName = "sitemesh", urlPatterns = UrlConst.ROOT)
public class SitemeshFilter extends SiteMeshFilter{

}
