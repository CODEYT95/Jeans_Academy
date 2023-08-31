package com.project.jeans.domain.message.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MessageDTO {

    private int message_no;
    private String message_sender;
    private String message_sed_isshow;
    private String message_receiver;
    private String message_rec_isshow;
    private String message_title;
    private String message_content;
    private Timestamp message_date;

}
