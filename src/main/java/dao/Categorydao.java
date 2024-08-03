package dao;

import entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class Categorydao {
    private SessionFactory sessionFactory;

    public Categorydao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public int saveCategory(Category category){
        try{
            Session session = this.sessionFactory.openSession();
            Transaction tx =session.beginTransaction();
//            System.out.println(session.save(category));
            int id =(int)session.save(category);
            session.close();
            return id;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("Categorydao : "+e);
        }
        return 0;
    }

    public List<Category> listCategory(){
        Session session = this.sessionFactory.openSession();
        Query q = session.createQuery("from Category ");
        List<Category> list = q.list();
        return list;
    }

    public Category getCategoryId(int id){
       Category categoryId = null;
       try{
           Session session = this.sessionFactory.openSession();
           categoryId = session.get(Category.class , id);
           session.close();
       }catch (Exception e){
           e.printStackTrace();
           System.out.println("Categorydao : "+e);
       }
        return categoryId;
    }
}
