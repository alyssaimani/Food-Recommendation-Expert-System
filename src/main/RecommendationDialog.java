package main;

import java.awt.BorderLayout;

import javax.swing.ImageIcon;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class RecommendationDialog extends JDialog {
    public RecommendationDialog(JFrame parent, String recommendationText, String imageFilename) {
        super(parent, "Food Recommendation", true);
        
        // Create a JLabel to display the recommendation text
        JLabel recommendationLabel = new JLabel(recommendationText);
        add(recommendationLabel);
        
        // Create a JLabel to display the image
        ImageIcon imageIcon = new ImageIcon(imageFilename);
        JLabel imageLabel = new JLabel(imageIcon);
        add(imageLabel);
        
        // Set the layout and pack the dialog
        setLayout(new BorderLayout());
        pack();
        
        // Set the dialog position relative to the parent frame
        setLocationRelativeTo(parent);
    }
}

