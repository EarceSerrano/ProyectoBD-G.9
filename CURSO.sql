alter session set "_ORACLE_SCRIPT"=true;
CREATE USER JAVA IDENTIFIED BY JAVA;
GRANT CONNECT, RESOURCE, DBA TO JAVA;