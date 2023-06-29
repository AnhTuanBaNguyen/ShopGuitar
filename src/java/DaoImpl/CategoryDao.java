/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DaoImpl;

import Dao.DBContext;
import Model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mr Tuan
 */
public class CategoryDao {

    public List<Category> getAll() {
        DBContext dBContext = new DBContext();
        List<Category> listCategory = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select *,(select count(id) from product where category_id = Category.id) as total_product from Category";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setTotalOfProduct(rs.getInt("total_product"));
                listCategory.add(category);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, e);
        }
        return listCategory;
    }

    public Category get(int id) {
        DBContext dBContext = new DBContext();
        Category category = new Category();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "select *, (select count(id) from product where category_id = Category.id) as total_product from Category where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setTotalOfProduct(rs.getInt("total_product"));
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, e);
        }
        return category;
    }

    public boolean update(Category category) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "UPDATE Category\n" + "   SET [name] = ?\n" + " WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, category.getName());
            ps.setInt(2, category.getId());
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean insert(Category category) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "insert into Category values(?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, category.getName());
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean delete(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "delete from Product where category_id=?\n"
                    + "delete from Category  where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException e) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public List<Category> getAll(int page) {
        Dao.DBContext dBContext = new Dao.DBContext();
        ArrayList<Category> listCategory = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "select * from Category\n"
                    + "order by id asc\n"
                    + "offset ? rows fetch next 5 rows only";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                listCategory.add(category);
            }
        } catch (SQLException e) {
            Logger.getLogger(Category.class.getName()).log(Level.SEVERE, null, e);
        }
        return listCategory;
    }

}
