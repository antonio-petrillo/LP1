public class MyClass {
	public static void main ( String [] args ) {
		RuntimeException re=null;
		throw re ;
		// Lancia null pointer exception perche' re non e' inizializzata ed la jvm quindi provera' ad usare un oggetto null
	}
}
