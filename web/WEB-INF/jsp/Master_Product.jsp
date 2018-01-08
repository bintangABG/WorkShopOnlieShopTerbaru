<%-- 
    Document   : Master_Product
    Created on : 31-Dec-2017, 21:25:34
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Master Product</title>
    </head>
    <body>
        
        <jsp:include page="header.jsp"/>
        <div class="container">
        <h1>Master Product</h1>
        <a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/product/tambah">Tambah</a>
        <hr/>
        
        <c:forEach var="x" items="${product}">
            <c:set var="jml" value="${jml+1}"></c:set>
        </c:forEach>
        <p>Total Product : ${jml}</p><hr/>
        Filter By Brand : 
        <ul>
            <c:forEach var="kat" items="${kategori}">
                <li><a href="${pageContext.request.contextPath}/admin/master/showByKategori">${kat.kategori}</a></li>
            </c:forEach>
        </ul>
        
        <hr/>
        <h2>Pencarian : </h2> 
        <form action="${pageContext.request.contextPath}/admin/master/search" method="POST">
            <input type="text" name="keyword" required="true" placeholder="masukan keyword"/>
            <select name="kategori">
                <c:forEach var="k" items="${product}">
                <option value="${k.idKategori.idKetegori}" label="${k.idKategori.kategori}"></option>
                </c:forEach>
            </select>
            <button type="submit">cari</button>
        </form>
            <hr/>
            <br/>
        <table border="1">
            <tr>
                <td>NO</td>
                <td>Nama Product</td>
                <td>Kategori</td>
                <td>Stok</td>
                <td>Harga</td>
                <td>Tanggal</td>
                <td colspan="2">Opsi</td>
            </tr>
            <c:forEach var="p" varStatus="i" items="${product}">
                <tr>
                    <td>${i.count}</td>
                    <td>${p.namaProduct}</td>
                    <td>${p.idKategori.kategori}</td>
                    <td>${p.qty}</td>
                    <td>${p.harga}</td>
                    <td>${p.createddate}</td>
                    <td><a href="${pageContext.request.contextPath}/admin/master/editProduct/${p.idProduct}"><button>Edit</button></a></td>
                    <td><a href="${pageContext.request.contextPath}/product/deleteProduct/${p.idProduct}"><button>Hapus</button></a></td>
                </tr>
            </c:forEach>
        </table>
            </div>


        <style>
            td{padding:3px;}
        </style>
    
    </body>
    
</html>
