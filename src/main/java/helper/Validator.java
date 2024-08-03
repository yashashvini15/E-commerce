package helper;

import entity.User;

public class Validator {
    static String userid = null;
    static String username = null;
    static String useremail = null;
    static String userpassword =null;
    static String userphone = null;
    static String useraddress = null;

    public Validator(User user , int userId) {
        this.userid = String.valueOf(userId);
        this.username =user.getUserName();
        this.userpassword=user.getUserPassword();
        this.useremail =user.getUserEmail();
        this.userphone =user.getUserPhone();
        this.useraddress =user.getUserAddress();
    }

    public boolean validateRegister(String username ,String userpassword ,String useremail, String userphone ,String useraddress){
        if(username!=null && !username.trim().equals("") &&
                userpassword!=null && !userpassword.trim().equals("") &&
                useremail!=null && !useremail.trim().equals("") &&
                useraddress!=null && !useraddress.trim().equals("") &&
                userphone!=null && !userphone.trim().equals("")){
            System.out.println("Validate : true");
            return true;
        }
        System.out.println("Validate : false");
        return false;
    }


}
