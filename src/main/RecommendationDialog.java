package main;

import java.awt.BorderLayout;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class RecommendationDialog extends JDialog {
    public RecommendationDialog(JFrame parent, String recommendationText, String imageFilename) {
        super(parent, "Food Recommendation", true);

        // Set the layout
        setLayout(new BorderLayout());

        // Create a JLabel to display the recommendation text
        JLabel recommendationLabel = new JLabel(recommendationText);
        Font font = new Font("Arial", Font.BOLD,24);
        recommendationLabel.setFont(font);
        recommendationLabel.setHorizontalAlignment(JLabel.CENTER);
        recommendationLabel.setVerticalAlignment(JLabel.CENTER);
        recommendationLabel.setHorizontalTextPosition(JLabel.CENTER);

        add(recommendationLabel, BorderLayout.NORTH);

        // Create a JLabel to display the image
        ImageIcon imageIcon = new ImageIcon(imageFilename);
        JLabel imageLabel = new JLabel(imageIcon);
        add(imageLabel, BorderLayout.CENTER);

        // Pack the dialog
        pack();

        // Set the dialog position relative to the parent frame
        setLocationRelativeTo(parent);
    }
}