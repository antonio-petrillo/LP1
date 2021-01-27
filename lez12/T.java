public class T{

	public static void main(String[] args){
		Integer x = new Integer(100);
		Integer y = new Integer(100);
		if(x == y){ // no
			System.out.println("equals 0");
		}
		int x1 = 100;
		Integer y1 = new Integer(100);
		if(x1 == y1){ // si
			System.out.println("equals 1");
		}
		int x2 = 100;
		float y2 = 100.0f;
		if(x2 == y2){ //si
			System.out.println("equals 2");
		}
		String x3 = new String("100");
		String y3 = new String("100");
		if(x3 == y3){ // no
			System.out.println("equals 3");
		}
		String x4 = "100";
		String y4 = "100";
		if(x4 == y4){ //si
			System.out.println("equals 4");
		}
	}

}
