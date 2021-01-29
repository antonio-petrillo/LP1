public class Test2{

	public static void main(String[] args){
		String s1 = "ciao";
//		s1.append("mondo");
		System.out.println(s1);
		String s2 = "ciao mondo";
		s2.trim();
		System.out.println(s2);
		String s3 = "ciao";
		s3.substring(3);
		System.out.println(s3);
		String s4 = "ciao";
		s4.replace('a', 'z');
		System.out.println(s4);
		String s5 = "ciao";
		s5.concat("mondo");
		System.out.println(s5);
		String s6 = "ciao";
		s6 += "mondo";
		System.out.println(s6);
	}

}
