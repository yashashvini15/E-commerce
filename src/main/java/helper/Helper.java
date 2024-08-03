package helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.HashMap;
import java.util.Map;

public class Helper
{
    public static Map<String , Long> getCounts(SessionFactory factory){
        Session session = factory.openSession();

        String q1= "Select count(*) from User";
        String q2 = "Select count(*) from Product";

        Query query1 = session.createQuery(q1);
        Query query2 = session.createQuery(q2);

        Long usercount = (Long)query1.list().get(0);
        Long productcount = (Long)query2.list().get(0);

        HashMap<String , Long > map = new HashMap<>();
        map.put("Usercount",usercount);
        map.put("Productcount",productcount);

        session.close();

        return map;

    }
}
