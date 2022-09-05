package com.HotelReservation.helper;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {

    private static String senderMail = "bibekkhatri709@gmail.com";
    private static String senderPassword = "yhlujcfmpcnamiee";

    public static boolean sendMail(String email, String subject, String messageToSend) {
        boolean status = false;

        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderMail, senderPassword);
            }
        });

        Message message = prepareMessage(session, senderMail, email, subject, messageToSend);

        try {
            Transport.send(message);
            status = true;
        } catch (MessagingException e) {
            e.printStackTrace();
            status = false;
        }

        return status;
    }

    private static Message prepareMessage(Session session, String email, String receipent, String subject, String messageToSend) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(receipent));
            message.setSubject(subject);
            String htmlCode = messageToSend;
            message.setContent(htmlCode, "text/html");
            return message;
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
