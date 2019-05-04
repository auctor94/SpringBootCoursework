package hello.domain;

public class ListReviews {

    private String username;
    private String coment;
    private String date;

    public String getUsername() {
        return username;
    }

    public ListReviews(String username, String coment, String date) {
        this.username = username;
        this.coment = coment;
        this.date = date;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComent() {
        return coment;
    }

    public void setComent(String coment) {
        this.coment = coment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
