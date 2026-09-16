package com.inventoryy;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProductDAO {

    // =============================================
    // ADD PRODUCT
    // =============================================
    public void addProduct(Product product) {

        String sql = "INSERT INTO products "
                + "(name, category, price, quantity) "
                + "VALUES (?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                return;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getName());
            ps.setString(2, product.getCategory());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());

            ps.executeUpdate();

            System.out.println("Product added successfully!");

            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println(
                    "Unable to add product."
            );

            System.out.println(
                    "Error: " + e.getMessage()
            );
        }
    }


    // =============================================
    // VIEW PRODUCTS
    // =============================================
    public List<Product> viewProducts() {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            java.sql.ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Product product = new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));

                products.add(product);
            }

        } catch (Exception e) {

            System.out.println(
                "Error while fetching products: "
                + e.getMessage()
            );
        }

        return products;
    }

    // =============================================
    // UPDATE PRODUCT
    // =============================================
    public void updateProduct(Product product) {

        String sql =
                "UPDATE products "
                + "SET name = ?, category = ?, price = ?, quantity = ? "
                + "WHERE id = ?";

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                return;
            }

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, product.getName());
            ps.setString(2, product.getCategory());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setInt(5, product.getId());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                System.out.println(
                        "Product updated successfully!"
                );

            } else {

                System.out.println(
                        "Product not found!"
                );
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println(
                    "Unable to update product."
            );

            System.out.println(
                    "Error: " + e.getMessage()
            );
        }
    }


    // =============================================
    // DELETE PRODUCT
    // =============================================
    public void deleteProduct(int id) {

        String sql =
                "DELETE FROM products WHERE id = ?";

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                return;
            }

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                System.out.println(
                        "Product deleted successfully!"
                );

            } else {

                System.out.println(
                        "Product not found!"
                );
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println(
                    "Unable to delete product."
            );

            System.out.println(
                    "Error: " + e.getMessage()
            );
        }
    }


    // =============================================
    // SEARCH PRODUCT
    // =============================================
    public void searchProduct(int id) {

        String sql =
                "SELECT * FROM products WHERE id = ?";

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                return;
            }

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            var rs = ps.executeQuery();

            if (rs.next()) {

                System.out.println();
                System.out.println("Product Found!");
                System.out.println(
                        "-------------------------"
                );

                System.out.println(
                        "ID: " + rs.getInt("id")
                );

                System.out.println(
                        "Name: " + rs.getString("name")
                );

                System.out.println(
                        "Category: "
                                + rs.getString("category")
                );

                System.out.println(
                        "Price: "
                                + rs.getDouble("price")
                );

                System.out.println(
                        "Quantity: "
                                + rs.getInt("quantity")
                );

            } else {

                System.out.println(
                        "Product not found!"
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println(
                    "Unable to search product."
            );

            System.out.println(
                    "Error: " + e.getMessage()
            );
        }
    }


    // =============================================
    // ADD STOCK
    // =============================================
    public void addStock(int id, int amount) {

        String sql =
                "UPDATE products "
                + "SET quantity = quantity + ? "
                + "WHERE id = ?";

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                return;
            }

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, amount);
            ps.setInt(2, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                System.out.println(
                        "Stock added successfully!"
                );

            } else {

                System.out.println(
                        "Product not found!"
                );
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            System.out.println(
                    "Unable to add stock."
            );

            System.out.println(
                    "Error: " + e.getMessage()
            );
        }
    }


    // =============================================
    // REDUCE STOCK
    // =============================================
    public void reduceStock(int id, int amount) {

        String checkSql =
                "SELECT quantity FROM products WHERE id = ?";

        String updateSql =
                "UPDATE products "
                + "SET quantity = quantity - ? "
                + "WHERE id = ?";

        try {

            Connection con = DBConnection.getConnection();

            if (con == null) {
                return;
            }

            PreparedStatement checkPs =
                    con.prepareStatement(checkSql);

            checkPs.setInt(1, id);

            var rs = checkPs.executeQuery();

            if (rs.next()) {

                int currentQuantity =
                        rs.getInt("quantity");

                if (amount <= currentQuantity) {

                    PreparedStatement updatePs =
                            con.prepareStatement(updateSql);

                    updatePs.setInt(1, amount);
                    updatePs.setInt(2, id);

                    updatePs.executeUpdate();

                    System.out.println(
                            "Stock reduced successfully!"
                    );

                    updatePs.close();

                } else {

                    System.out.println(
                            "Not enough stock!"
                    );

                    System.out.println(
                            "Available stock: "
                                    + currentQuantity
                    );
                }

            } else {

                System.out.println(
                        "Product not found!"
                );
            }

            rs.close();
            checkPs.close();
            con.close();

        } catch (Exception e) {

            System.out.println(
                    "Unable to reduce stock."
            );

            System.out.println(
                    "Error: " + e.getMessage()
            );
        }
    }


    // =============================================
    // CHECK LOW STOCK
    // =============================================
 // =============================================
 // CHECK LOW STOCK
 // =============================================
 public List<Product> checkLowStock() {

     List<Product> lowStockProducts = new ArrayList<>();

     String sql =
             "SELECT * FROM products "
             + "WHERE quantity <= 5";

     try {

         Connection con = DBConnection.getConnection();

         if (con == null) {
             return lowStockProducts;
         }

         PreparedStatement ps =
                 con.prepareStatement(sql);

         var rs = ps.executeQuery();

         while (rs.next()) {

             Product product = new Product();

             product.setId(rs.getInt("id"));
             product.setName(rs.getString("name"));
             product.setCategory(rs.getString("category"));
             product.setPrice(rs.getDouble("price"));
             product.setQuantity(rs.getInt("quantity"));

             lowStockProducts.add(product);
         }

         rs.close();
         ps.close();
         con.close();

     } catch (Exception e) {

         System.out.println(
                 "Unable to check low stock."
         );

         System.out.println(
                 "Error: " + e.getMessage()
         );
     }
     System.out.println("Low stock products found: " + lowStockProducts.size());
     return lowStockProducts;
 }
//TOTAL PRODUCTS COUNT
public int getTotalProducts() {

  int count = 0;

  String sql = "SELECT COUNT(*) FROM products";

  try {

      Connection con = DBConnection.getConnection();

      PreparedStatement ps = con.prepareStatement(sql);

      var rs = ps.executeQuery();

      if(rs.next()) {
          count = rs.getInt(1);
      }

      rs.close();
      ps.close();
      con.close();

  } catch(Exception e) {

      System.out.println(e.getMessage());

  }

  return count;
}


//TOTAL STOCK QUANTITY
public int getTotalStock() {

  int stock = 0;

  String sql = "SELECT SUM(quantity) FROM products";


  try {

      Connection con = DBConnection.getConnection();

      PreparedStatement ps =
              con.prepareStatement(sql);


      var rs = ps.executeQuery();


      if(rs.next()) {

          stock = rs.getInt(1);

      }


      rs.close();
      ps.close();
      con.close();


  } catch(Exception e) {

      System.out.println(e.getMessage());

  }


  return stock;
}



//LOW STOCK COUNT
public int getLowStockCount() {


  int count = 0;


  String sql =
      "SELECT COUNT(*) FROM products WHERE quantity <= 5";


  try {


      Connection con =
              DBConnection.getConnection();


      PreparedStatement ps =
              con.prepareStatement(sql);



      var rs = ps.executeQuery();



      if(rs.next()) {

          count = rs.getInt(1);

      }


      rs.close();
      ps.close();
      con.close();



  } catch(Exception e) {

      System.out.println(e.getMessage());

  }


  return count;

}

//RECENT PRODUCTS
public List<Product> getRecentProducts() {

 List<Product> products = new ArrayList<>();

 String sql =
     "SELECT * FROM products ORDER BY id DESC LIMIT 5";


 try {

     Connection con = DBConnection.getConnection();

     PreparedStatement ps =
             con.prepareStatement(sql);


     var rs = ps.executeQuery();


     while(rs.next()) {


         Product product = new Product();


         product.setId(
             rs.getInt("id")
         );


         product.setName(
             rs.getString("name")
         );


         product.setCategory(
             rs.getString("category")
         );


         product.setPrice(
             rs.getDouble("price")
         );


         product.setQuantity(
             rs.getInt("quantity")
         );


         products.add(product);

     }


     rs.close();
     ps.close();
     con.close();


 } catch(Exception e) {

     System.out.println(
         "Error loading recent products: "
         + e.getMessage()
     );

 }


 return products;

}
}