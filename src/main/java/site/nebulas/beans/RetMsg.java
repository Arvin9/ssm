package site.nebulas.beans;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * Created by Administrator on 2017/3/10.
 */
public class RetMsg {
    public static final Integer SUCCESS = 1;
    public static final Integer FAILURE = 0;
    private Integer state;
    private String msg;
    private Object data;

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
