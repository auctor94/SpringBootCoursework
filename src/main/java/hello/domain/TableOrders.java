package hello.domain;

public class TableOrders {

    private String id;
    private String _type;
    private String time;
    private String cost;
    private String date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String get_type() {
        return _type;
    }

    public void set_type(String _type) {
        this._type = _type;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
