package main;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import javax.swing.UIManager;
import javax.swing.plaf.ColorUIResource;

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

	public FoodRecomendation() throws JessException {
		
		engine.batch("main/forward.clp");
		engine.reset();
		engine.run();
		
		res = engine.runQueryStar("find-ask", new ValueVector());

		Font font = new Font("Arial", Font.BOLD,16);
		textArea.setFont(font);
		textArea.setLineWrap(true);
		textArea.setWrapStyleWord(true);
		textArea.setBackground(new ColorUIResource(255,239,187));
		
		if(res.next()) {
			textArea.setText(res.getString("text")+ " [ya/tidak]:");
			val = res.get("id");
		}
		add(textArea, "North");

		yesBtn.setBackground(new ColorUIResource(255,239,187));
		noBtn.setBackground(new ColorUIResource(255,239,187));
		
		btnGrp.add(yesBtn);
		btnGrp.add(noBtn);
		panel.add(yesBtn);
		panel.add(noBtn);
		panel.setBackground(new ColorUIResource(255,239,187));
		add(panel, "Center");
		
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
						textArea.setText(res.getString("text")+ " [ya/tidak]:");
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
							displayRecommendation("Tidak ada rekomendasi makanan yang sesuai");
						}else {
							displayRecommendation(result);
						}
						
						engine.reset();
						engine.run();
						res = engine.runQueryStar("find-ask", new ValueVector());
						if(res.next()) {
							textArea.setText(res.getString("text") + " [ya/tidak]:");
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

		UIManager UI = new UIManager();
        UI.put("OptionPane.background",new ColorUIResource(255,239,187));
        UI.put("Panel.background",new ColorUIResource(255,239,187));
		
		setTitle("Food Recomendation");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(350,250);
		setLocationRelativeTo(null);
		setVisible(true);
		
	}

    // Method to display the recommendation and associated image
    private void displayRecommendation(String recommendationText) {
		String imageFilename = "";
		if (recommendationText.contains("Lapis Legit")) {
        	imageFilename = "\\src\\images\\lapis_legit.jpg";
		} else if (recommendationText.contains("Yogurt")) {
			imageFilename = "\\src\\images\\yogurt.jpg";
		} else if (recommendationText.contains("Salad")) {
			imageFilename = "\\src\\images\\salad.jpg";
		} else if (recommendationText.contains("Sapo Tahu")) {
			imageFilename = "\\src\\images\\sapo_tahu.jpg";
		} else if (recommendationText.contains("Gado-Gado")) {
			imageFilename = "\\src\\images\\gado_gado.jpg";
		} else if (recommendationText.contains("Rendang")) {
			imageFilename = "\\src\\images\\rendang.jpg";
		} else if (recommendationText.contains("Puding Chia")) {
			imageFilename = "\\src\\images\\puding_chia.jpg";
		} else if (recommendationText.contains("Black Forest")) {
			imageFilename = "\\src\\images\\black_forest.jpg";
		} else if (recommendationText.contains("Cokelat Batangan")) {
			imageFilename = "\\src\\images\\coklat_batangan.jpg";
		} else if (recommendationText.contains("Ice Cream")) {
			imageFilename = "\\src\\images\\ice_cream.jpg";
		} else if (recommendationText.contains("Bubur Sumsum")) {
			imageFilename = "\\src\\images\\bubur_sumsum.jpg";
		} else if (recommendationText.contains("Wedang Ronde")) {
			imageFilename = "\\src\\images\\wedang_ronde.jpg";
		} else if (recommendationText.contains("Telur Rebus")) {
			imageFilename = "\\src\\images\\telur_rebus.jpg";
		} else if (recommendationText.contains("Omelet Sayur")) {
			imageFilename = "\\src\\images\\omelet_sayur.jpg";
		} else if (recommendationText.contains("Ikan Bakar Balado")) {
			imageFilename = "\\src\\images\\ikan_bakar_balado.jpg";
		} else if (recommendationText.contains("Sop Buntut")) {
			imageFilename = "\\src\\images\\sop_buntut.jpg";
		} else if (recommendationText.contains("Ayam Rebus")) {
			imageFilename = "\\src\\images\\ayam_rebus.jpg";
		} else {
			imageFilename = "\\src\\images\\not_available.jpg";
		}

		RecommendationDialog dialog = new RecommendationDialog(this, recommendationText, System.getProperty("user.dir") + imageFilename);
		dialog.setVisible(true);

}
	public static void main(String[] args) throws JessException {
		new FoodRecomendation();
	}

}
