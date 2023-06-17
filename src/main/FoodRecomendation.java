package main;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;

import jess.JessException;
import jess.QueryResult;
import jess.Rete;
import jess.Value;
import jess.ValueVector;

public class FoodRecomendation extends JFrame {
	
	Rete engine = new Rete();
	QueryResult res, sol;
	Value val;
	JTextArea textArea = new JTextArea(3,25);
	JPanel panel = new JPanel();
	JLabel imageLabel = new JLabel();
	JButton nextButton = new JButton("Pertanyaan Selanjutnya");
	JRadioButton yesBtn = new JRadioButton("Ya", true);
	JRadioButton noBtn = new JRadioButton("Tidak");
	ButtonGroup btnGrp = new ButtonGroup();
	private Map<String, String> imageMapping;

	public FoodRecomendation() throws JessException {
		
		engine.batch("main/backward.clp");
		engine.reset();
		engine.run();
		
		textArea.setWrapStyleWord(true);
		textArea.setEditable(false);
		res = engine.runQueryStar("find-ask", new ValueVector());
		
		if(res.next()) {
			textArea.setText(res.getString("text"));
			val = res.get("id");
		}
		add(textArea, "North");
		
		btnGrp.add(yesBtn);
		btnGrp.add(noBtn);
		panel.add(yesBtn);
		panel.add(noBtn);
		add(panel, "Center");
		
		initializeImageMapping();
		
		nextButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent agr0) {
				String text;
				if(yesBtn.isSelected()) text = "ya";
				else text = "tidak";
				try {
					engine.eval("(assert (answer (id "+ val + ") (answer \"" + text + "\")))");
					engine.run();
					engine.eval("(assert (remove-ask (id "+ val + ")))");
					engine.run();
					res = engine.runQueryStar("find-ask", new ValueVector());
					
					if(res.next()) {
						textArea.setText(res.getString("text"));
						val = res.get("id");
					}else {
						sol = engine.runQueryStar("find-recommendation", new ValueVector());
						String result = "";
						while(sol.next()) {
							result += sol.getString("text");
							result += "\n";
						}
						
						add(imageLabel, BorderLayout.CENTER);
						
						if(result.equals("")) {
							JOptionPane.showMessageDialog(null, "Tidak ada rekomendasi makanan yang sesuai!");
						}else {
							// JOptionPane.showMessageDialog(null, result);
							displayRecommendation(result);
						}
						
						engine.reset();
						engine.run();
						res = engine.runQueryStar("find-ask", new ValueVector());
						if(res.next()) {
							textArea.setText(res.getString("text"));
							val = res.get("id");
						}
						yesBtn.setSelected(true);
						
					}
					
				} catch (JessException e) {
					e.printStackTrace();
				}
				
			}
		});
		
		add(nextButton, "South");
		
		setTitle("Food Recomendation");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		pack();
		setLocationRelativeTo(null);
		setVisible(true);
		
	}
	
	// Method to initialize the image mapping
	// This mapping is used to map the recommendation text to the image filename
    private void initializeImageMapping() {
        imageMapping = new HashMap<>();
		imageMapping.put("Rekomendasi makanan untuk Anda adalah Lapis Legit", "/src/images/lapis_legit.jpg");
		imageMapping.put("Rekomendasi makanan untuk Anda adalah Roti Gandum", "/src/images/roti_gandum.jpg");
		imageMapping.put("Rekomendasi makanan untuk Anda adalah Salad", "/src/images/salad.jpg");
		imageMapping.put("Rekomendasi makanan untuk Anda adalah Sapo Tahu", "/src/images/sapo_tahu.jpg");
		imageMapping.put("Rekomendasi makanan untuk Anda adalah Gado-Gado", "/src/images/gado_gado.jpg");
		imageMapping.put("Rekomendasi makanan untuk Anda adalah Rendang", "/src/images/rendang.jpg");
        
    }

    // Method to display the recommendation and associated image
    private void displayRecommendation(String recommendationText) {
        String imageFilename = imageMapping.get(recommendationText);
        if (imageFilename != null) {
        	try {
				BufferedImage image = ImageIO.read(new File(System.getProperty("user.dir") + imageFilename));
				ImageIcon imageIcon = new ImageIcon(image);
	            imageLabel.setIcon(imageIcon);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
        }else {
			JOptionPane.showMessageDialog(null, recommendationText);
		}
    }
	
	public static void main(String[] args) throws JessException {
		new FoodRecomendation();
	}

}
