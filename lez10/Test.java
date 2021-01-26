 package lez10;

 import java.util.*;

 public class Test{

	public static void main(String [] args){
		int[] x = new int[25];
		System.out.println("la lunghezza di x e' : " + x.length);
		System.out.println("il valore di x[0] e' : " + x[0]);
		int y = -1; y = y >>> 5;
		System.out.println(y);
		y = -1; y = y >>> 32;
		byte b = -1;
		System.out.println(y);
		b = -1; b = (byte) (b >>> 5);
		System.out.println(b);
		y = -1; y = y >> 5;
		System.out.println(y);
		System.out.println("value := "  + ((y > -1) ? 99.99 : 9));
		int z =1;
		String[] nomi = {"Puja", "Sua", "Sucuzzone"};
		nomi[--z] += ".";
		for(int i=0; i<nomi.length; i++){
			System.out.println(nomi[i]);
		}
		
	}

 }

