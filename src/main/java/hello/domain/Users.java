package hello.domain;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
public class Users {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id_user;

    @Column(name="name")
    private String name;

    @Column(name="password")
    private String password;

    @Column(name="status")
    private String status;

    @OneToMany(mappedBy = "idUser")
    private Set<Review> reviewDetails;

    public Integer getIdUser() {
        return id_user;
    }

    public void setIdUser(Integer idUser) {
        this.id_user = idUser;
    }

    public Set<Review> getReviewDetails() {
        return reviewDetails;
    }

    public void setReviewDetails(Set<Review> reviewDetails) {
        this.reviewDetails = reviewDetails;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
