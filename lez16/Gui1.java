import javax.swing.*;
import Java.awt.event.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
public class Gui1 implements ActionListener{

	private JFrame frame;
	private JButton button;

	public static void main(String[] args){
		new Gui1().go();
	}

	public void go(){
 		frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		button = new JButton("Click me");
		button.addActionListener(this);

		frame.getContentPane().add(button);
		frame.setSize(300,300);
		frame.setVisible(true);
	}

	public void actionPerformed(ActionEvent event){
		button.setText("Clicked");
	}
}

