<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>

<%
Conexion c = new Conexion();
Connection cn = c.conectar();

if(cn != null){
    out.println("CONEXION EXITOSA");
}else{
    out.println("CONEXION NULL");
}
%>