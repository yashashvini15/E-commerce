package dao;

import entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class Productdao {
    private SessionFactory sessionFactory;

    public Productdao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean saveProduct(Product product){
        boolean f =false;
        try{
            Session session = this.sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            System.out.println("Product saved ");
            f = true;
            session.close();
        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("Productdao : "+e);
            f= false;
        }
        return f;
    }

    public List<Product> getAllProduct(){
        Session session = this.sessionFactory.openSession();
        Query q = session.createQuery("from Product");
        List<Product> list = q.list();
        session.close();
        return list;
    }

    public List<Product> getAllProductByID(int id){
        Session session = this.sessionFactory.openSession();
        Query q = session.createQuery("from Product as p where p.category.categoryId=:productid");
        q.setParameter("productid" ,id);
        List<Product> list = q.list();
        session.close();
        return list;
    }
}
