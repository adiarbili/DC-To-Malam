import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.Font;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.JButton;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class Login extends JFrame
{
	private final JLabel lblNewLabel = new JLabel("Malam");
	private final JLabel lblId = new JLabel("ID :");
	private final JLabel lblPassword = new JLabel("Password :");
	private JTextField ID_JTextFiled;
	private JPasswordField pass_JPasswordField;
	
	public Login()
	{
		setTitle("Malam - login");
		setResizable(false);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		getContentPane().setLayout(null);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBounds(0, 0, 338, 183);
		getContentPane().add(panel_1);
		panel_1.setLayout(null);
		lblNewLabel.setBounds(124, 11, 76, 28);
		panel_1.add(lblNewLabel);
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 23));
		lblId.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblId.setBounds(31, 56, 32, 31);
		panel_1.add(lblId);
		lblPassword.setFont(new Font("Times New Roman", Font.PLAIN, 16));
		lblPassword.setBounds(31, 108, 76, 26);
		panel_1.add(lblPassword);
		
		JButton btnLogin = new JButton("Login");
		btnLogin.addActionListener(new ActionListener() {			
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				try 
				{
					new Auto(ID_JTextFiled.getText(), pass_JPasswordField.getPassword());
				} 
				catch (Exception ex) 
				{
					ex.printStackTrace();
					//Auto.terminateChormeDriverProc();
				}

			}
		});



		btnLogin.setBounds(239, 149, 89, 23);
		panel_1.add(btnLogin);
		
		ID_JTextFiled = new JTextField();
		ID_JTextFiled.setBounds(107, 61, 86, 20);
		panel_1.add(ID_JTextFiled);
		ID_JTextFiled.setColumns(10);
		
		
		pass_JPasswordField = new JPasswordField();
		pass_JPasswordField.setBounds(107, 113, 86, 20);
		panel_1.add(pass_JPasswordField);
		
		ID_JTextFiled.setText("xxxx");
		pass_JPasswordField.setText("xxx");
		
		setSize(344, 211);
		setLocationRelativeTo(null);
		setVisible(true);
		
	}
			
	public static void main(String[] args)
	{
		new Login();
	}
}
