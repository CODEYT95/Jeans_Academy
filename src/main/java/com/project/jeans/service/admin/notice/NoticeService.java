package com.project.jeans.service.admin.notice;

import com.project.jeans.domain.admin.notice.dto.NoticeDTO;

import java.util.List;

public interface NoticeService {
    public List<NoticeDTO> selectAll();
}
