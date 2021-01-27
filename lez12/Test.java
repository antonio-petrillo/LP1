public class Test{

	static int x = 39;

	static {
		System.out.println("Primo" +(++x));
	}

	public static void main(String[] args){
		System.out.println("Terzo (main) " + (++x));

	}


	static {
		System.out.println("Secondo " + (++x));
	}
}
