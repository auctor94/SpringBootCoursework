package hello.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "tickets")
public class Tickets {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="id_ticket")
    private int ticketId;

    @Column(name="cost")
    private double cost;

    @Column(name="name_ticket")
    private String nameTicket;

    @Column(name="age")
    private String age;

    @Column(name="time")
    private int time;

    @Column(name="zone")
    private String zone;

    @Column(name="sale")
    private double sale;

    @OneToMany(mappedBy = "id_user")
    private Set<Orders> ordersDetails;

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getNameTicket() {
        return nameTicket;
    }

    public void setNameTicket(String nameTicket) {
        this.nameTicket = nameTicket;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getZone() {
        return zone;
    }

    public void setZone(String zone) {
        this.zone = zone;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }
}
