package entity;

import jakarta.persistence.*;
import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
public class User {
    @Id
    @Column(name = "uId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;

    @NotBlank(message = "Username cannot be blank")
    private String userName;

    @NotBlank(message = "Userpassword cannot be blank")
    private String userPassword;

    @NotBlank(message = "user type cannot be blank")
    private String userType;

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword  + ", userEmail= "+userEmail+ ", userPhone="+userPhone+", userAddress=" + userAddress +", userId=" + userId + "}";
    }

    @Email(message = "Invalid email format")
    @NotBlank(message = "UserEmail Cannot be blank")
    @Pattern(
            regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$",
            message = "Email must contain at least one uppercase letter, one lowercase letter, one number, and one special character"
    )
    @Column(name = "userEmail", unique = false)
    private String userEmail;

    @Pattern(
            regexp = "^[0-9]{10}$",
            message = "Phone number must be exactly 10 digits"
    )
    @Column(length = 13,name = "user_Phno")
    @NotBlank(message = "Userphone cannot be blank")
    private String userPhone;

    @Column(length = 100 )
    @NotBlank(message = "Useraddress cannot be blank")
    private String userAddress;

    @Lob
    private String userPic;

    public User() {
        super();
    }

    public User(String userPassword, String userName, String userEmail, String userPhone, String userAddress, String userPic, int userId, String userType) {
        this.userPassword = userPassword;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userPic = userPic;
        this.userId = userId;
        this.userType = userType;
    }

    public User(String userName, String userPassword, String userType, String userEmail, String userPhone, String userAddress, String userPic) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userType = userType;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userPic = userPic;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public @Email(message = "Invalid email format") @Pattern(
            regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$",
            message = "Email must contain at least one uppercase letter, one lowercase letter, one number, and one special character"
    ) String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(@Email(message = "Invalid email format") @Pattern(
            regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]+$",
            message = "Email must contain at least one uppercase letter, one lowercase letter, one number, and one special character"
    ) String userEmail) {
        this.userEmail = userEmail;
    }

    public @Pattern(
            regexp = "^[0-9]{10}$",
            message = "Phone number must be exactly 10 digits"
    ) String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(@Pattern(
            regexp = "^[0-9]{10}$",
            message = "Phone number must be exactly 10 digits"
    ) String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public @NotBlank(message = "user type cannot be blank") String getUserType() {
        return userType;
    }

    public void setUserType(@NotBlank(message = "user type cannot be blank") String userType) {
        this.userType = userType;
    }
}
