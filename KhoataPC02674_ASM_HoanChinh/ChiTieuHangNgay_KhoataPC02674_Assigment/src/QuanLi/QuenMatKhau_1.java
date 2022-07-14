/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package QuanLi;


import Helper.SendMail_LayMaHelper;
import Helper.ShareHelper;
import Helper.checkHelper;
import Model.NguoiDung;
import DAO.NguoiDungDAO;
import Helper.DialogHelper;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author Admin
 */
public class QuenMatKhau_1 extends javax.swing.JFrame {
     public  String temp= null;
     public String nguoiNhan = null;
     public SendMail_LayMaHelper sMLayMa = new SendMail_LayMaHelper();
     public NguoiDungDAO ndDao = new NguoiDungDAO();
     static String taiKhoan = null;
     
    /**
     * Creates new form QuenMatKhau
     */
    public QuenMatKhau_1() {
        initComponents();
        init();
                

    }
    
    public void init(){
        setIconImage(ShareHelper.APP_ICON);
        setTitle("CHI TIÊU HÀNG NGÀY");
        setLocationRelativeTo(null);
        txtMaXacNhan.setEnabled(false);
        btnOK.setEnabled(false);
    }
    
     public boolean check(){
         boolean error = false;
         try {
             List<NguoiDung> nguoiDung = ndDao.getTk_Email(txtEmail.getText(),txtTaiKhoan.getText());
         if(nguoiDung.isEmpty()){
             error=false;
         }
         else{
         error= true;
         }
         } catch (Exception e) {
             DialogHelper.alert(this, "Lỗi truy vấn");
             
         }
         return error;
     }
   
    
    public void btnLayMa(){
            this.temp= sMLayMa.layma();

            sMLayMa.sendMail(txtEmail.getText(),temp);
   
            JOptionPane.showMessageDialog(this, "Gửi mã xác nhận thành công","Thông báo", JOptionPane.INFORMATION_MESSAGE);
            txtMaXacNhan.setEnabled(true);
          
          
            
    }
    
    public void btnOK(){
        try {
              
                if(txtMaXacNhan.getText().equals(this.temp)){
                taiKhoan = txtTaiKhoan.getText();
                JOptionPane.showMessageDialog(this, "Nhập mã xác nhận đúng","Thông báo", JOptionPane.INFORMATION_MESSAGE);
                this.setVisible(false);
                new QuenMatKhau_2().setVisible(true);
              }
                else{
                JOptionPane.showMessageDialog(this, "Nhập mã xác nhận không đúng","Thông báo", JOptionPane.INFORMATION_MESSAGE);
                }
              
        } catch (Exception e) {
            
            JOptionPane.showMessageDialog(this, "Mã xác nhận bị lỗi","Thông báo", JOptionPane.INFORMATION_MESSAGE);
        }
        
    }
    
    public void reset(){
        txtEmail.setText("");
        txtMaXacNhan.setText("");
        txtMaXacNhan.setEnabled(false);
        txtTaiKhoan.setText("");
       
    }
    
    public void layMa(){
        if(checkHelper.checkEmail(txtEmail)){
            if(check()==true){
                    btnLayMa();
                    btnOK.setEnabled(true);
            }
            else{
                DialogHelper.alert(this, "Vui lòng xem lại tài khoản và email có đúng khi đăng ký không?");
            }
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        btnLayMa = new javax.swing.JButton();
        btnRESET = new javax.swing.JButton();
        btnOK = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txtTaiKhoan = new javax.swing.JTextField();
        txtEmail = new javax.swing.JTextField();
        txtMaXacNhan = new javax.swing.JTextField();
        lblBackGround = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnLayMa.setBackground(new java.awt.Color(13, 126, 255));
        btnLayMa.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnLayMa.setForeground(new java.awt.Color(255, 255, 255));
        btnLayMa.setText("Lấy mã");
        btnLayMa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLayMaActionPerformed(evt);
            }
        });
        jPanel1.add(btnLayMa, new org.netbeans.lib.awtextra.AbsoluteConstraints(289, 139, -1, -1));

        btnRESET.setBackground(new java.awt.Color(13, 126, 255));
        btnRESET.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnRESET.setForeground(new java.awt.Color(255, 255, 255));
        btnRESET.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/Refresh.png"))); // NOI18N
        btnRESET.setText("RESET");
        btnRESET.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRESETActionPerformed(evt);
            }
        });
        jPanel1.add(btnRESET, new org.netbeans.lib.awtextra.AbsoluteConstraints(272, 254, -1, -1));

        btnOK.setBackground(new java.awt.Color(13, 126, 255));
        btnOK.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnOK.setForeground(new java.awt.Color(255, 255, 255));
        btnOK.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Images/Add_1.png"))); // NOI18N
        btnOK.setText("OK");
        btnOK.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnOKActionPerformed(evt);
            }
        });
        jPanel1.add(btnOK, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 254, -1, -1));

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(13, 113, 180));
        jLabel1.setText("Tài khoản");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 40, -1, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(13, 113, 180));
        jLabel2.setText("Email");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 90, -1, -1));

        jLabel4.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(13, 113, 180));
        jLabel4.setText("Mã xác nhận");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 190, -1, -1));
        jPanel1.add(txtTaiKhoan, new org.netbeans.lib.awtextra.AbsoluteConstraints(138, 40, 225, -1));

        txtEmail.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtEmailActionPerformed(evt);
            }
        });
        jPanel1.add(txtEmail, new org.netbeans.lib.awtextra.AbsoluteConstraints(138, 91, 225, -1));
        jPanel1.add(txtMaXacNhan, new org.netbeans.lib.awtextra.AbsoluteConstraints(138, 187, 225, 30));

        lblBackGround.setBackground(new java.awt.Color(199, 229, 245));
        lblBackGround.setOpaque(true);
        jPanel1.add(lblBackGround, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 430, 300));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnLayMaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLayMaActionPerformed
        // TODO add your handling code here:
        if(checkHelper.checkNullText(txtTaiKhoan) && checkHelper.checkNullText(txtEmail)){
            if(check()){
            layMa();
            }
            else{
            DialogHelper.alert(this, "Vui lòng nhập đúng tài khoản và email đã đăng ký");
            }
        }
        
        
    }//GEN-LAST:event_btnLayMaActionPerformed

    private void btnOKActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnOKActionPerformed
        // TODO add your handling code here:
        if(checkHelper.checkNullText(txtTaiKhoan) && checkHelper.checkNullText(txtEmail)&& checkHelper.checkNullText(txtMaXacNhan)){
            if(check()){
            btnOK();
            }
            else{
            DialogHelper.alert(this, "Vui lòng nhập đúng tài khoản và email đã đăng ký");
            }
        }
        
    }//GEN-LAST:event_btnOKActionPerformed

    private void btnRESETActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRESETActionPerformed
        // TODO add your handling code here:
        reset();
    }//GEN-LAST:event_btnRESETActionPerformed

    private void txtEmailActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtEmailActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtEmailActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(QuenMatKhau_1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(QuenMatKhau_1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(QuenMatKhau_1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(QuenMatKhau_1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new QuenMatKhau_1().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnLayMa;
    private javax.swing.JButton btnOK;
    private javax.swing.JButton btnRESET;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel lblBackGround;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtMaXacNhan;
    private javax.swing.JTextField txtTaiKhoan;
    // End of variables declaration//GEN-END:variables
}
