package hello.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "amusement")
public class Amusement {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="id_amusement")
    private int amusementId;

    @Column(name="department")
    private String department;

    @OneToMany(mappedBy="zone")
    private Set<Tickets> items;


    public Amusement() {
    }

    public Amusement(String department) {
        this.department = department;
    }

    public int getAmusementId() {
        return amusementId;
    }

    public void setAmusementId(int amusementId) {
        this.amusementId = amusementId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
