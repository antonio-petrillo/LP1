public class Test{

	public static void main(String[] args){
		String s = "Antonio";
		String s2 = s;
		System.out.println(s);
		System.out.println(s2);
		String x = "Petrillo";
		x.concat(" Antonio");
		System.out.println(x);
		String s3 = "A";
		String s4 = s3 + "B";
		s3.concat(s3);
		s3 += "D";
		System.out.println(s3 + s4);
		String s5 = "abc";
		String s6 = s5 + "";
		String s7 = "abc";
		System.out.println(s5 == s6);
		System.out.println(s5 == s7);

	}

	
}
