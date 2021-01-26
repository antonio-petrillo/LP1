public class Test{

	public static void main(String[] args){
		// cosi gia' non funziona per eseguire le addizzioni java effettua l'upcast a int, il quale non e' compatibile con short
		//short s1= 8, s2 = 10, s3;
		//s3 = s1 + s2;
		//System.out.println(s3);
		//short s4 = 255, s5 = 1, s6;
		//s6 = s4 + s5;
		//System.out.println(s6);


		short s1= 8, s2 = 10;
		int s3;
		s3 = s1 + s2;
		System.out.println(s3);
		short s4 = 255, s5 = 1;
		int s6;
		s6 = s4 + s5;
		System.out.println(s6);
	}

}
