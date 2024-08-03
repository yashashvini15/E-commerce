package dao;

import entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Userdao {

    private SessionFactory factory;

    public Userdao(SessionFactory factory) {
        this.factory = factory;
    }


    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        try{
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session= this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p" , password);

            user = (User)q.uniqueResult();

        }catch(Exception e){
            e.printStackTrace();
            System.out.println(" Userdao : "+e);
        }
        return user;
    }
}
