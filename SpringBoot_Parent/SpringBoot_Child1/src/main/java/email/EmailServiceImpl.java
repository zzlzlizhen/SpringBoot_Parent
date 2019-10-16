package email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {
    @Autowired
    EmailConfig emailConfig;
    @Autowired
    JavaMailSender javaMailSender;
    @Override
    public void sendEmail(String sendTo, String title, String conntent) {
        try {
            SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
            simpleMailMessage.setFrom(emailConfig.getEmailFrom());
            simpleMailMessage.setTo(sendTo);
            simpleMailMessage.setSubject(title);
            simpleMailMessage.setText(conntent);
            javaMailSender.send(simpleMailMessage);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
