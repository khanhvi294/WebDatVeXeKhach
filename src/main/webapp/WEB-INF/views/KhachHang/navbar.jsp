<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="wheel-menu-wrap ">
            <div class="container-fluid wheel-bg1">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="wheel-logo">
                            <a href="index.html"><img src="images/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-sm-9 col-xs-12 padd-lr0">
                        <div class="wheel-top-menu clearfix">
                            <div class="wheel-top-menu-info">
                                <div class="top-menu-item"><a href="#"><i class="fa fa-phone"></i><span>0912345678</span></a></div>
                                <div class="top-menu-item"><a href="#"><i class="fa fa-envelope"></i><span>p.h.n.phuong1812@gmail.com</span></a></div>
                            </div>
                            <div class="wheel-top-menu-log">
                                <div class="top-menu-item">
                                
                               <c:choose> 
                                <c:when test="${vaitro!=null}">
                                    <div class="dropdown wheel-user-ico">
                                        <button class="btn btn-default dropdown-toggle">
                                      ${user.getHoKH()} ${user.getTenKH() }
                                        <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a href="thongtincanhan.html">Thông tin cá nhân</a></li>
                                            <li><a href="doimatkhau.html">Đổi mật khẩu</a></li>
                                            <li><a href="vedat.html">Vé đặt</a></li>
                                            <li><a href="dangxuat.html">Đăng xuất</a></li>
                                        </ul>
                                    </div>
                                    </c:when>
                                    <c:when test="${vaitro == null}">
                                    <div class="dropdown wheel-user-ico">
                                        <button class="btn btn-default dropdown-toggle" type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                        Đăng nhập
                                        <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                        
                                            <li><a href="dangnhap.html">Đăng nhập</a></li>
                                            <li><a href="dangki.html">Đăng kí</a></li>
                                        </ul>
                                    </div>
                                    </c:when>
                                  </c:choose>
                                    
                                </div>                              
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9 ">
                        <div class="wheel-navigation">
                            <nav id="dl-menu">
                                <ul class="main-menu dl-menu">
                                    <li class="menu-item   current-menu-parent menu-item-has-children   active-color ">
                                        <a href="trangchu.html">Trang chủ</a>
                                    </li>
                                    <li class="menu-item   ">
                                        <a href="timchuyen.html">Đặt vé</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children  ">
                                        <a href="contact.html">Liên hệ</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children  ">
                                        <a href="about.html">Giới Thiệu</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children  ">
                                        <a href="news.html">Tin tức</a>
                                    </li>
                                </ul>
                                <div class="nav-menu-icon"><i></i></div>
                            </nav>
                            <a href="timchuyen.html" class="wheel-cheader-but" >Đặt vé ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>