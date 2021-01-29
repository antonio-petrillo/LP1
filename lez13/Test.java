public class Test{

	public static void main(String[] args){
		Object ob = new Object ();
		String stringarr [] = new String [50];
		Float floater = new Float (3.14f);
		ob = stringarr ;
		ob = stringarr [5];
		floater = (Float) ob ;
		ob = floater ;
	}

}
