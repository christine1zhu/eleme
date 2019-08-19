package com.example.eleme.pojo;

import java.util.Date;

public class MsgDB {
    private String id;

    private String sender_id;

    private String receiver_id;

    private String chat_msg;

    private String sgin_flag;

    private Date create_time;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSender_id() {
        return sender_id;
    }

    public void setSender_id(String sender_id) {
        this.sender_id = sender_id == null ? null : sender_id.trim();
    }

    public String getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(String receiver_id) {
        this.receiver_id = receiver_id == null ? null : receiver_id.trim();
    }

    public String getChat_msg() {
        return chat_msg;
    }

    public void setChat_msg(String chat_msg) {
        this.chat_msg = chat_msg == null ? null : chat_msg.trim();
    }

    public String getSgin_flag() {
        return sgin_flag;
    }

    public void setSgin_flag(String sgin_flag) {
        this.sgin_flag = sgin_flag == null ? null : sgin_flag.trim();
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}