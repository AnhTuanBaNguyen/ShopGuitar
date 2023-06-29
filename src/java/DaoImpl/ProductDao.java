/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DaoImpl;

import Dao.BaseImageDao;
import Dao.DBContext;
import Model.Category;
import Model.Product;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;


/* *
 * @author haimi
 */
public class ProductDao implements BaseImageDao<Product> {

    public List<Product> search(String sort, int categoryId, int minPrice, int maxPrice, String name) {
        DBContext dBContext = new DBContext();
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product p WHERE 1=1";
        sql = addCategoryID(sql, categoryId); // WHERE CategoryID=
        sql = addUnitPrice(sql, minPrice, maxPrice); // WHERE UnitsPrice BETWEEN
        sql = addSearchByName(sql, name);
        sql = sortProduct(sql, sort);
        try {
            Connection connection = dBContext.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
                product = getCategoryProduct(connection, product);
                products.add(product);
            }
            dBContext.closeConnection(connection, ps);
        } catch (SQLException e) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, e);
        }
        return products;
    }

    public Product getofUser(int id) {
        DBContext dBContext = new DBContext();
        Product product = new Product();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * from Product where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
            }
            product = getCategoryProduct(connection, product);
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, e);
        }
        return product;
    }

    public Product get(int id) {
        DBContext dBContext = new DBContext();
        Product product = new Product();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * from Product where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
            }
            product = getCategoryProduct(connection, product);
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, e);
        }
        return product;
    }

    @Override
    public String uploadImage(Part filePart, HttpServletRequest request, Product product) {
        if (filePart.getSize() == 0) {
            return new ProductDao().get(product.getId()).getImage();
        } else {
            if (product.getId() != 0) {
                try {
                    String fileName = Paths
                            .get(filePart.getSubmittedFileName())
                            .getFileName()
                            .toString();
                    Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                            "cloud_name", "dphdoh9qo",
                            "api_key", "899222149965195",
                            "api_secret", "MtwIam7__8S6GKlnSEPxG-6Akl0"));

                    cloudinary.config.secure = true;
                    filePart.write(request.getRealPath("/image") + fileName);
                    Map path = ObjectUtils.asMap(
                            "public_id",
                            "Home/Images/Product/" + product.getId(),
                            "overwrite",
                            true,
                            "resource_type",
                            "image"
                    );
                    Map uploadResult = cloudinary
                            .uploader()
                            .upload(request.getRealPath("image") + fileName, path);
                    filePart.delete();
                    return uploadResult.get("secure_url").toString();
                } catch (IOException ex) {
                    Logger
                            .getLogger(ProductDao.class.getName())
                            .log(Level.SEVERE, null, ex);
                }
            }
        }
        return "";
    }

    public boolean update(Product product) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "UPDATE Product\n"
                    + "   SET [category_id] = ?\n"
                    + "      ,[name] = ?\n"
                    + "      ,[price] =?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[image] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, product.getCategoryId());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getImage());
            ps.setInt(6, product.getId());
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException ex) {
            Logger
                    .getLogger(ProductDao.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Product> getAll(int page) {
        DBContext dBContext = new DBContext();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * from Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
                product = getCategoryProduct(connection, product);
                products.add(product);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger
                    .getLogger(ProductDao.class.getName())
                    .log(Level.SEVERE, null, e);
        }
        return products;
    }

    public List<Product> getAll() {
        DBContext dBContext = new DBContext();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * from Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
                product = getCategoryProduct(connection, product);
                products.add(product);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger
                    .getLogger(ProductDao.class.getName())
                    .log(Level.SEVERE, null, e);
        }
        return products;
    }

    @Override
    public void destroyImage(int id) {
        try {
            Cloudinary cloudinary = new Cloudinary(
                    ObjectUtils.asMap(
                            "cloud_name",
                            "dphdoh9qo",
                            "api_key",
                            "899222149965195",
                            "api_secret",
                            "MtwIam7__8S6GKlnSEPxG-6Akl0"
                    )
            );
            cloudinary.config.secure = true;
            Map path = ObjectUtils.asMap("resource_type", "image");
            cloudinary
                    .uploader()
                    .destroy("Home/Images/Product/" + Integer.toString(id), path);
        } catch (IOException ex) {
            Logger
                    .getLogger(ProductDao.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }

    public boolean delete(int id) {
        DBContext dBContext = new DBContext();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "DELETE FROM Product WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insert(Product product) {
        DBContext dBContext = new DBContext();
        String sql
                = "INSERT INTO [dbo].[Product]\n"
                + "           ([category_id]\n"
                + "           ,[name]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "     )VALUES(?,?,?,?,?)";
        try {
            Connection connection = dBContext.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, product.getCategoryId());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setString(
                    5,
                    "https://res.cloudinary.com/dphdoh9qo/image/upload/v1688032101/maxresdefault_si7zm8.jpg"
            );
            ps.executeUpdate();
            dBContext.closeConnection(connection, ps);
            return true;
        } catch (SQLException ex) {
            Logger
                    .getLogger(ProductDao.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Product getLast() {
        DBContext dBContext = new DBContext();
        Product product = new Product();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select top 1  * from Product ORDER BY id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
                product = getCategoryProduct(connection, product);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, e);
        }
        return product;
    }

    public List<Product> getofCategory(int id, int page) {
        DBContext dBContext = new DBContext();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql
                    = "select * from Product\n"
                    + "where category_id = ?\n"
                    + "order by id\n"
                    + "offset ? rows fetch next 5 rows only";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, (page - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
                product = getCategoryProduct(connection, product);
                products.add(product);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, e);
        }
        return products;
    }

    public List<Product> getofCategory(int id) {
        DBContext dBContext = new DBContext();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select * from Product\n" + "where category_id = ?\n";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
                product = getCategoryProduct(connection, product);
                products.add(product);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, e);
        }
        return products;
    }

    private String addCategoryID(String sql, int categoryId) {
        StringBuilder sb = new StringBuilder(sql);
        if (categoryId > 0) {
            sb.append(" AND category_id=").append(categoryId);
        }
        return sb.toString();
    }

    private String addUnitPrice(String sql, long begin, long end) {
        StringBuilder sb = new StringBuilder(sql);
        if (end > 0) {
            sb
                    .append(" AND price BETWEEN ")
                    .append(begin)
                    .append(" AND ")
                    .append(end);
        }
        return sb.toString();
    }

    private String addSearchByName(String sql, String name) {
        StringBuilder sb = new StringBuilder(sql);
        if (!name.isEmpty()) {
            sb.append(" AND name like '%").append(name).append("%'");
        }
        return sb.toString();
    }

    private String sortProduct(String sql, String sort) {
        StringBuilder sb = new StringBuilder(sql);
        switch (sort) {
            case "sortNameAsc": {
                sb.append(" ORDER BY name ASC");
                break;
            }
            case "sortNameDesc": {
                sb.append(" ORDER BY name DESC");
                break;
            }
            case "sortPriceAsc": {
                sb.append(" ORDER BY price DESC");
                break;
            }
            case "sortPriceDesc": {
                sb.append(" ORDER BY price ASC");
                break;
            }
            case "sortNew": {
                sb.append(" ORDER BY id DESC");
                break;
            }
            default: {
                sb.append(" ORDER BY id DESC");
                break;
            }
        }
        return sb.toString();
    }

    private Product getCategoryProduct(Connection connection, Product product) {
        try {
            String quesry = "select * from Category where id=?";
            PreparedStatement prS = connection.prepareStatement(quesry);
            prS.setInt(1, product.getCategoryId());
            ResultSet resultSet = prS.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                product.setCategory(category);
            }
        } catch (SQLException e) {
            Logger
                    .getLogger(ProductDao.class.getName())
                    .log(Level.SEVERE, null, e);
        }
        return product;
    }

    public List<Product> getTop5OfCategory(int categoryId) {
        DBContext dBContext = new DBContext();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = dBContext.getConnection();
            String sql = "select top 5 * from Product where category_id = ? ORDER BY id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getInt("price"),
                        rs.getString("image")
                );
                product = getCategoryProduct(connection, product);
                products.add(product);
            }
            dBContext.closeConnection(connection, ps, rs);
        } catch (SQLException e) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, e);
        }
        return products;
    }

}
