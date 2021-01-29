public class Eccezioni {
public static void main ( String [] args ) {
try {
if ( args . length == 0) return ;
System . out . println ( args [0]);
}
finally {
System . out . println (" Fine ");
}
}
}
